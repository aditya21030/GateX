import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import '../models/note_model.dart';

class PdfGeneratorService {
  static final PdfGeneratorService _instance = PdfGeneratorService._internal();
  factory PdfGeneratorService() => _instance;
  PdfGeneratorService._internal();

  /// Generates a professional publication-grade PDF dossier and opens the native Share sheet.
  Future<bool> generateAndSharePdf({
    required SubjectNote note,
    required bool isProUser,
  }) async {
    try {
      final doc = pw.Document();

      final brandOrange = PdfColor.fromHex('#FF8522');
      final brandDark = PdfColor.fromHex('#0F172A');
      final textSecondary = PdfColor.fromHex('#64748B');
      final lightCardBg = PdfColor.fromHex('#F8FAFC');
      final accentMint = PdfColor.fromHex('#10B981');
      final alertCoral = PdfColor.fromHex('#EF4444');

      doc.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.symmetric(horizontal: 32, vertical: 36),
          header: (context) {
            return pw.Container(
              padding: const pw.EdgeInsets.only(bottom: 12),
              margin: const pw.EdgeInsets.only(bottom: 16),
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  bottom: pw.BorderSide(color: PdfColors.grey300, width: 0.8),
                ),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Row(
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: pw.BoxDecoration(
                          color: brandOrange,
                          borderRadius: pw.BorderRadius.circular(6),
                        ),
                        child: pw.Text(
                          'GateX',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      pw.SizedBox(width: 8),
                      pw.Text(
                        'OFFICIAL PREPARATION DOSSIER',
                        style: pw.TextStyle(
                          color: textSecondary,
                          fontSize: 9,
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  pw.Text(
                    'TRACK: ${note.branch == 'BOTH' ? 'GATE DA & CS/IT' : (note.branch == 'CSIT' ? 'GATE CS/IT' : 'GATE DA')}',
                    style: pw.TextStyle(
                      color: brandOrange,
                      fontSize: 9,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          footer: (context) {
            return pw.Container(
              margin: const pw.EdgeInsets.only(top: 14),
              padding: const pw.EdgeInsets.only(top: 8),
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(color: PdfColors.grey200, width: 0.8),
                ),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'GateX • Comprehensive Revision Series • All Rights Reserved',
                    style: pw.TextStyle(color: textSecondary, fontSize: 8),
                  ),
                  pw.Text(
                    'Page ${context.pageNumber} of ${context.pagesCount}',
                    style: pw.TextStyle(color: textSecondary, fontSize: 8, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
            );
          },
          build: (context) {
            return [
              // Cover / Title Block
              pw.Container(
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  color: lightCardBg,
                  borderRadius: pw.BorderRadius.circular(12),
                  border: pw.Border.all(color: PdfColors.grey200),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            note.title,
                            style: pw.TextStyle(
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                              color: brandDark,
                            ),
                          ),
                        ),
                        pw.Container(
                          padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: pw.BoxDecoration(
                            color: isProUser ? accentMint : brandOrange,
                            borderRadius: pw.BorderRadius.circular(6),
                          ),
                          child: pw.Text(
                            isProUser ? 'PRO EDITION' : 'ESSENTIAL EDITION',
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 8.5,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      note.subtitle,
                      style: pw.TextStyle(fontSize: 10, color: textSecondary),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 18),

              // PART 1: CORE CONCEPTS & FORMULAS (FREE + PRO)
              pw.Text(
                'PART I: CORE CONCEPTS & SUMMARY',
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                  color: brandDark,
                  letterSpacing: 0.8,
                ),
              ),
              pw.SizedBox(height: 8),

              ...note.freeSections.map((sec) {
                return pw.Container(
                  margin: const pw.EdgeInsets.only(bottom: 14),
                  padding: const pw.EdgeInsets.all(12),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.white,
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(color: PdfColors.grey300),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        sec.title,
                        style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: brandOrange),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        sec.summary,
                        style: pw.TextStyle(fontSize: 9.5, color: brandDark),
                      ),
                      pw.SizedBox(height: 8),
                      pw.Text(
                        'Key Takeaways:',
                        style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold, color: brandDark),
                      ),
                      pw.SizedBox(height: 4),
                      ...sec.keyPoints.map(
                        (kp) => pw.Padding(
                          padding: const pw.EdgeInsets.only(left: 6, bottom: 2),
                          child: pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('• ', style: pw.TextStyle(color: brandOrange, fontWeight: pw.FontWeight.bold)),
                              pw.Expanded(
                                child: pw.Text(kp, style: pw.TextStyle(fontSize: 9, color: brandDark)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (sec.coreFormulas.isNotEmpty) ...[
                        pw.SizedBox(height: 8),
                        pw.Container(
                          width: double.infinity,
                          padding: const pw.EdgeInsets.all(8),
                          decoration: pw.BoxDecoration(
                            color: lightCardBg,
                            borderRadius: pw.BorderRadius.circular(6),
                            border: pw.Border.all(color: PdfColors.grey200),
                          ),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'Formulas to Memorize:',
                                style: pw.TextStyle(fontSize: 8.5, fontWeight: pw.FontWeight.bold, color: textSecondary),
                              ),
                              pw.SizedBox(height: 3),
                              ...sec.coreFormulas.map(
                                (cf) => pw.Text('  $cf', style: pw.TextStyle(fontSize: 9, color: brandDark, fontWeight: pw.FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              }),

              // PART 2: PRO DEEP-DIVE & EXAM TRAPS
              if (isProUser && note.proSections.isNotEmpty) ...[
                pw.SizedBox(height: 12),
                pw.Text(
                  'PART II: PRO DEEP DIVE, GATE TRAPS & WORKED EXAMPLES',
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                    color: brandDark,
                    letterSpacing: 0.8,
                  ),
                ),
                pw.SizedBox(height: 8),

                ...note.proSections.map((proSec) {
                  return pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 14),
                    padding: const pw.EdgeInsets.all(12),
                    decoration: pw.BoxDecoration(
                      color: lightCardBg,
                      borderRadius: pw.BorderRadius.circular(8),
                      border: pw.Border.all(color: PdfColors.orange200),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          proSec.title,
                          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: brandDark),
                        ),
                        pw.SizedBox(height: 6),
                        pw.Text(
                          proSec.inDepthTheory.trim(),
                          style: pw.TextStyle(fontSize: 9, color: brandDark),
                        ),
                        if (proSec.examTraps.isNotEmpty) ...[
                          pw.SizedBox(height: 8),
                          pw.Container(
                            width: double.infinity,
                            padding: const pw.EdgeInsets.all(8),
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromHex('#FEF2F2'),
                              borderRadius: pw.BorderRadius.circular(6),
                              border: pw.Border.all(color: alertCoral),
                            ),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  '⚠️ CRITICAL GATE EXAM TRAPS',
                                  style: pw.TextStyle(fontSize: 8.5, fontWeight: pw.FontWeight.bold, color: alertCoral),
                                ),
                                pw.SizedBox(height: 3),
                                ...proSec.examTraps.map(
                                  (trap) => pw.Padding(
                                    padding: const pw.EdgeInsets.only(bottom: 2),
                                    child: pw.Text(trap, style: pw.TextStyle(fontSize: 8.5, color: brandDark)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (proSec.solvedExample.trim().isNotEmpty) ...[
                          pw.SizedBox(height: 8),
                          pw.Container(
                            width: double.infinity,
                            padding: const pw.EdgeInsets.all(8),
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromHex('#F0FDF4'),
                              borderRadius: pw.BorderRadius.circular(6),
                              border: pw.Border.all(color: accentMint),
                            ),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  '✓ SOLVED NUMERICAL BENCHMARK',
                                  style: pw.TextStyle(fontSize: 8.5, fontWeight: pw.FontWeight.bold, color: accentMint),
                                ),
                                pw.SizedBox(height: 3),
                                pw.Text(
                                  proSec.solvedExample.trim(),
                                  style: pw.TextStyle(fontSize: 8.5, color: brandDark),
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (proSec.shortcutTips.isNotEmpty) ...[
                          pw.SizedBox(height: 8),
                          pw.Container(
                            width: double.infinity,
                            padding: const pw.EdgeInsets.all(8),
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromHex('#FFF7ED'),
                              borderRadius: pw.BorderRadius.circular(6),
                              border: pw.Border.all(color: brandOrange),
                            ),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  '⚡ AIR-1 TOPPER SHORTCUT TRICKS',
                                  style: pw.TextStyle(fontSize: 8.5, fontWeight: pw.FontWeight.bold, color: brandOrange),
                                ),
                                pw.SizedBox(height: 3),
                                ...proSec.shortcutTips.map(
                                  (tip) => pw.Padding(
                                    padding: const pw.EdgeInsets.only(bottom: 2),
                                    child: pw.Text(tip, style: pw.TextStyle(fontSize: 8.5, color: brandDark)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                }),
              ],
            ];
          },
        ),
      );

      final bytes = await doc.save();
      final tempDir = await getTemporaryDirectory();
      final cleanSubject = note.id.replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '_');
      final fileName = 'GateX_Notes_$cleanSubject.pdf';
      final file = File('${tempDir.path}/$fileName');
      await file.writeAsBytes(bytes, flush: true);

      await Share.shareXFiles(
        [XFile(file.path, mimeType: 'application/pdf', name: fileName)],
        subject: '${note.title} - GATE Study Notes (GateX)',
        text: 'Sharing ${note.title} Comprehensive Revision Dossier generated via GateX.',
      );

      return true;
    } catch (e) {
      debugPrint('Error generating PDF: $e');
      return false;
    }
  }
}
