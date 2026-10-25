# Sample Mock Questions for GateX

This directory serves as a ready-to-use template for authoring GATE questions with pure LaTeX ($math$), diagrams, and options.

## Quick Test:
Validate the sample questions:
```bash
python tools/scripts/publish_mock.py --input tools/sample_mock/ --validate
```

Compile to JSON:
```bash
python tools/scripts/publish_mock.py --input tools/sample_mock/ --mock-id da_full_mock_1 --output tools/sample_mock/compiled_mock.json
```

Publish directly to Firebase Firestore Over-The-Air:
```bash
python tools/scripts/publish_mock.py --input tools/sample_mock/ --mock-id da_full_mock_1 --upload --service-account your_service_account.json
```
