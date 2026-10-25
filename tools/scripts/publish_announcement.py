#!/usr/bin/env python3
"""
GateX Live Announcement Publisher
==================================
Publishes a live breaking news or announcement banner to all users' Home Screen
without requiring an app update.

Usage:
  1. Publish urgent announcement:
     python tools/scripts/publish_announcement.py --title "⚡ GATE 2026 Response Sheet Live" --message "IIT Roorkee released response sheets. Check your score now!" --type urgent --action-text "Predict Score 🎯" --action-url "route:predictor" --service-account serviceAccountKey.json

  2. Publish Pro sale announcement:
     python tools/scripts/publish_announcement.py --title "🎉 Weekend Special: GateX Pro Pass" --message "Get full CBT Mocks and Pro Notes valid till GATE 2027!" --type pro_sale --action-text "Upgrade (₹299) 👑" --action-url "route:pro" --service-account serviceAccountKey.json

  3. Clear/Hide active announcement:
     python tools/scripts/publish_announcement.py --clear --service-account serviceAccountKey.json
"""

import sys
import argparse
from pathlib import Path
from datetime import datetime

# UTF-8 for Windows console
if sys.platform == 'win32':
    try:
        sys.stdout.reconfigure(encoding='utf-8')
        sys.stderr.reconfigure(encoding='utf-8')
    except Exception:
        pass

def main():
    parser = argparse.ArgumentParser(description="GateX Live Announcement Publisher")
    parser.add_argument('--title', default='GateX Announcement', help="Banner title text")
    parser.add_argument('--message', default='', help="Banner subtitle/message body")
    parser.add_argument('--type', choices=['info', 'urgent', 'pro_sale', 'celebration'], default='info', help="Color theme & icon style")
    parser.add_argument('--action-text', help="Button text (e.g. 'Check Cutoffs 🎯')")
    parser.add_argument('--action-url', help="Button route (e.g. 'route:predictor', 'route:pro', 'route:mocks', or 'https://...')")
    parser.add_argument('--clear', action='store_true', help="Disable/hide the active announcement")
    parser.add_argument('--service-account', default='serviceAccountKey.json', help="Path to Firebase Service Account JSON credentials")

    args = parser.parse_args()

    service_account = Path(args.service_account)
    if not service_account.exists():
        print(f"⚠️  Note: Service account not found at '{service_account}'.")
        print("   Showing simulated announcement payload ready for Firestore:\n")
        doc_payload = {
            'enabled': not args.clear,
            'id': f"ann_{datetime.now().strftime('%Y%m%d_%H%M%S')}" if not args.clear else 'disabled',
            'title': args.title,
            'message': args.message,
            'type': args.type,
            'actionText': args.action_text,
            'actionUrl': args.action_url,
            'updated_at': datetime.now().isoformat(),
        }
        import json
        print(json.dumps(doc_payload, indent=2))
        print("\n👉 To publish live via Firebase Console:")
        print("   Open Firestore -> Collection 'metadata' -> Document 'announcement' -> Paste above fields.")
        return

    try:
        import firebase_admin
        from firebase_admin import credentials, firestore
    except ImportError:
        print("❌ Error: firebase-admin Python package not installed.")
        print("   Run: pip install firebase-admin")
        sys.exit(1)

    if not firebase_admin._apps:
        cred = credentials.Certificate(str(service_account))
        firebase_admin.initialize_app(cred)

    db = firestore.client()
    doc_ref = db.collection('metadata').doc('announcement')

    if args.clear:
        doc_ref.set({
            'enabled': False,
            'id': 'disabled',
            'updated_at': firestore.SERVER_TIMESTAMP,
        }, merge=True)
        print("✅ Active announcement cleared and disabled.")
        return

    unique_id = f"ann_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
    payload = {
        'enabled': True,
        'id': unique_id,
        'title': args.title,
        'message': args.message,
        'type': args.type,
        'actionText': args.action_text,
        'actionUrl': args.action_url,
        'updated_at': firestore.SERVER_TIMESTAMP,
    }

    doc_ref.set(payload, merge=True)
    print(f"✅ Successfully published live announcement: '{args.title}'")
    print(f"   ID: {unique_id}")
    print("   All active student devices will display this banner on next app launch!")

if __name__ == '__main__':
    main()
