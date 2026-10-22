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

  /// Converts all Unicode math symbols, Greek letters, and emojis into clean standard ASCII
  /// so that PDF standard fonts render 100% crisply with zero tofu boxes ([X]).
  static String _clean(String input) {
    if (input.isEmpty) return '';
    var s = input;

    // Greek letters
    s = s
        .replaceAll('α', 'alpha')
        .replaceAll('β', 'beta')
        .replaceAll('γ', 'gamma')
        .replaceAll('δ', 'delta')
        .replaceAll('ϵ', 'epsilon')
        .replaceAll('ε', 'epsilon')
        .replaceAll('θ', 'theta')
        .replaceAll('λ', 'lambda')
        .replaceAll('μ', 'mu')
        .replaceAll('π', 'pi')
        .replaceAll('ρ', 'rho')
        .replaceAll('σ', 'sigma')
        .replaceAll('ϕ', 'phi')
        .replaceAll('χ', 'chi')
        .replaceAll('Δ', 'Delta')
        .replaceAll('Σ', 'Sigma')
        .replaceAll('Λ', 'Lambda')
        .replaceAll('∇', 'grad');

    // Mathematical operators & relations
    s = s
        .replaceAll('≥', '>=')
        .replaceAll('≤', '<=')
        .replaceAll('≠', '!=')
        .replaceAll('≈', '~=')
        .replaceAll('±', '+/-')
        .replaceAll('×', ' x ')
        .replaceAll('÷', ' / ')
        .replaceAll('·', ' * ')
        .replaceAll('∑', 'sum')
        .replaceAll('∏', 'prod')
        .replaceAll('√', 'sqrt')
        .replaceAll('∞', 'inf')
        .replaceAll('→', ' -> ')
        .replaceAll('⇒', ' => ')
        .replaceAll('⇔', ' <=> ')
        .replaceAll('≡', ' == ')
        .replaceAll('⊢', ' |- ')
        .replaceAll('∈', ' in ')
        .replaceAll('∉', ' not in ')
        .replaceAll('⊂', ' subset ')
        .replaceAll('⊆', ' subseteq ')
        .replaceAll('∪', ' U ')
        .replaceAll('∩', ' INTERSECT ')
        .replaceAll('∨', ' OR ')
        .replaceAll('∧', ' AND ')
        .replaceAll('¬', ' NOT ')
        .replaceAll('∀', 'for all ')
        .replaceAll('∃', 'there exists ')
        .replaceAll('⋈', ' JOIN ')
        .replaceAll('‖', '||')
        .replaceAll('⟨', '<')
        .replaceAll('⟩', '>')
        .replaceAll('⌊', 'floor(')
        .replaceAll('⌋', ')')
        .replaceAll('⌈', 'ceil(')
        .replaceAll('⌉', ')');

    // Accented / decorated notations
    s = s
        .replaceAll('X̄', 'X_mean')
        .replaceAll('ŷ', 'y_hat')
        .replaceAll('ȳ', 'y_bar')
        .replaceAll('f̂', 'f_hat')
        .replaceAll('x̂', 'x_hat')
        .replaceAll('ŵ', 'w_hat');

    // Bullets, punctuation & emojis
    s = s
        .replaceAll('•', '-')
        .replaceAll('⚠️', '[!]')
        .replaceAll('✓', '[OK]')
        .replaceAll('⚡', '[*]')
        .replaceAll('⭐', '[*]')
        .replaceAll('👑', '[PRO]')
        .replaceAll('🎁', '')
        .replaceAll('—', '-')
        .replaceAll('–', '-')
        .replaceAll('’', "'")
        .replaceAll('‘', "'")
        .replaceAll('“', '"')
        .replaceAll('”', '"');

    // Subscripts & Superscripts
    s = s
        .replaceAll('₀', '_0')
        .replaceAll('₁', '_1')
        .replaceAll('₂', '_2')
        .replaceAll('₃', '_3')
        .replaceAll('₄', '_4')
        .replaceAll('₅', '_5')
        .replaceAll('₆', '_6')
        .replaceAll('₇', '_7')
        .replaceAll('₈', '_8')
        .replaceAll('₉', '_9')
        .replaceAll('ᵢ', '_i')
        .replaceAll('ⱼ', '_j')
        .replaceAll('ₖ', '_k')
        .replaceAll('ₙ', '_n')
        .replaceAll('⁰', '^0')
        .replaceAll('¹', '^1')
        .replaceAll('²', '^2')
        .replaceAll('³', '^3')
        .replaceAll('⁴', '^4')
        .replaceAll('⁵', '^5')
        .replaceAll('⁶', '^6')
        .replaceAll('⁷', '^7')
        .replaceAll('⁸', '^8')
        .replaceAll('⁹', '^9')
        .replaceAll('ⁿ', '^n')
        .replaceAll('ⁱ', '^i');

    // Filter to valid printable ASCII characters only
    final buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final code = s.codeUnitAt(i);
      if ((code >= 32 && code <= 126) || code == 10 || code == 13 || code == 9) {
        buffer.writeCharCode(code);
      } else {
        buffer.write(' ');
      }
    }
    return buffer.toString();
  }

  /// Generates a professional publication-grade PDF and opens the native Share sheet.
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
          margin: const pw.EdgeInsets.symmetric(horizontal: 28, vertical: 30),
          header: (context) {
            return pw.Container(
              padding: const pw.EdgeInsets.only(bottom: 8),
              margin: const pw.EdgeInsets.only(bottom: 12),
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
                        padding: const pw.EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                        decoration: pw.BoxDecoration(
                          color: brandOrange,
                          borderRadius: pw.BorderRadius.circular(4),
                        ),
                        child: pw.Text(
                          'GateX',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      pw.SizedBox(width: 8),
                      pw.Text(
                        'OFFICIAL PREPARATION STUDY NOTES',
                        style: pw.TextStyle(
                          color: textSecondary,
                          fontSize: 8,
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                  pw.Text(
                    'TRACK: ${note.branch == 'CSIT' ? 'GATE CS/IT' : 'GATE DA'}',
                    style: pw.TextStyle(
                      color: brandOrange,
                      fontSize: 8.5,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          footer: (context) {
            return pw.Container(
              margin: const pw.EdgeInsets.only(top: 10),
              padding: const pw.EdgeInsets.only(top: 6),
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(color: PdfColors.grey200, width: 0.8),
                ),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'GateX | Comprehensive Revision Series | All Rights Reserved',
                    style: pw.TextStyle(color: textSecondary, fontSize: 7.5),
                  ),
                  pw.Text(
                    'Page ${context.pageNumber} of ${context.pagesCount}',
                    style: pw.TextStyle(color: textSecondary, fontSize: 7.5, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
            );
          },
          build: (context) {
            return [
              // Cover / Title Block
              pw.Container(
                padding: const pw.EdgeInsets.all(12),
                margin: const pw.EdgeInsets.only(bottom: 12),
                decoration: pw.BoxDecoration(
                  color: lightCardBg,
                  borderRadius: pw.BorderRadius.circular(8),
                  border: pw.Border.all(color: PdfColors.grey300, width: 0.8),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            _clean(note.title),
                            style: pw.TextStyle(
                              fontSize: 16,
                              fontWeight: pw.FontWeight.bold,
                              color: brandDark,
                            ),
                          ),
                        ),
                        pw.Container(
                          padding: const pw.EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                          decoration: pw.BoxDecoration(
                            color: isProUser ? accentMint : brandOrange,
                            borderRadius: pw.BorderRadius.circular(4),
                          ),
                          child: pw.Text(
                            isProUser ? 'PRO EDITION' : 'CORE EDITION',
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 7.5,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 3),
                    pw.Text(
                      _clean(note.subtitle),
                      style: pw.TextStyle(fontSize: 9, color: textSecondary),
                    ),
                  ],
                ),
              ),

              // PART 1: CORE CONCEPTS & SUMMARY
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 4),
                margin: const pw.EdgeInsets.only(bottom: 6),
                decoration: pw.BoxDecoration(
                  border: pw.Border(bottom: pw.BorderSide(color: brandOrange, width: 1.5)),
                ),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'PART I: CORE CONCEPTS & FORMULA CHEATSHEET',
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                        color: brandOrange,
                        letterSpacing: 0.5,
                      ),
                    ),
                    pw.Text(
                      'ESSENTIAL RECALL',
                      style: pw.TextStyle(fontSize: 7.5, color: textSecondary, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // Iterate free sections cleanly without nesting in a single rigid outer container
              ...note.freeSections.expand((sec) {
                return [
                  // Section Title Banner
                  pw.Container(
                    margin: const pw.EdgeInsets.only(top: 8, bottom: 4),
                    padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex('#FFF7ED'),
                      borderRadius: pw.BorderRadius.circular(4),
                      border: pw.Border(left: pw.BorderSide(color: brandOrange, width: 3)),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          _clean(sec.title),
                          style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: brandDark),
                        ),
                        pw.SizedBox(height: 1.5),
                        pw.Text(
                          _clean(sec.summary),
                          style: pw.TextStyle(fontSize: 8, color: textSecondary),
                        ),
                      ],
                    ),
                  ),

                  // Key Takeaways
                  ...sec.keyPoints.map(
                    (kp) => pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 6, bottom: 2.5),
                      child: pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            width: 3,
                            height: 3,
                            margin: const pw.EdgeInsets.only(top: 3.5, right: 5),
                            decoration: pw.BoxDecoration(shape: pw.BoxShape.circle, color: brandOrange),
                          ),
                          pw.Expanded(
                            child: pw.Text(
                              _clean(kp),
                              style: pw.TextStyle(fontSize: 8, color: brandDark, lineSpacing: 1.15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Formulas Box
                  if (sec.coreFormulas.isNotEmpty)
                    pw.Container(
                      width: double.infinity,
                      margin: const pw.EdgeInsets.only(top: 3, bottom: 8),
                      padding: const pw.EdgeInsets.all(6),
                      decoration: pw.BoxDecoration(
                        color: lightCardBg,
                        borderRadius: pw.BorderRadius.circular(4),
                        border: pw.Border.all(color: PdfColors.grey300, width: 0.6),
                      ),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'FORMULAS TO REMEMBER:',
                            style: pw.TextStyle(fontSize: 7, fontWeight: pw.FontWeight.bold, color: brandOrange),
                          ),
                          pw.SizedBox(height: 2),
                          ...sec.coreFormulas.map(
                            (cf) => pw.Padding(
                              padding: const pw.EdgeInsets.only(bottom: 1.5),
                              child: pw.Text(
                                '  ${_clean(cf)}',
                                style: pw.TextStyle(fontSize: 8, color: brandDark, fontWeight: pw.FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ];
              }),

              // PART 2: PRO DEEP DIVE, TRAPS & WORKED EXAMPLES
              if (isProUser && note.proSections.isNotEmpty) ...[
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(vertical: 4),
                  margin: const pw.EdgeInsets.only(top: 14, bottom: 6),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(bottom: pw.BorderSide(color: brandDark, width: 1.5)),
                  ),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'PART II: PRO IN-DEPTH DOSSIER, TRAPS & SOLVED EXAMPLES',
                        style: pw.TextStyle(
                          fontSize: 10,
                          fontWeight: pw.FontWeight.bold,
                          color: brandDark,
                          letterSpacing: 0.5,
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                        decoration: pw.BoxDecoration(color: brandOrange, borderRadius: pw.BorderRadius.circular(3)),
                        child: pw.Text('PRO EXCLUSIVE', style: pw.TextStyle(fontSize: 6.5, fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
                      ),
                    ],
                  ),
                ),

                ...note.proSections.expand((proSec) {
                  return [
                    // Pro Section Title
                    pw.Container(
                      margin: const pw.EdgeInsets.only(top: 8, bottom: 4),
                      padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: pw.BoxDecoration(
                        color: PdfColor.fromHex('#F1F5F9'),
                        borderRadius: pw.BorderRadius.circular(4),
                        border: pw.Border(left: pw.BorderSide(color: brandDark, width: 3)),
                      ),
                      child: pw.Text(
                        _clean(proSec.title),
                        style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold, color: brandDark),
                      ),
                    ),

                    // In-Depth Theory
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 4, bottom: 5),
                      child: pw.Text(
                        _clean(proSec.inDepthTheory.trim()),
                        style: pw.TextStyle(fontSize: 8, color: brandDark, lineSpacing: 1.2),
                      ),
                    ),

                    // Exam Traps
                    if (proSec.examTraps.isNotEmpty)
                      pw.Container(
                        width: double.infinity,
                        margin: const pw.EdgeInsets.only(top: 3, bottom: 5),
                        padding: const pw.EdgeInsets.all(6),
                        decoration: pw.BoxDecoration(
                          color: PdfColor.fromHex('#FEF2F2'),
                          borderRadius: pw.BorderRadius.circular(4),
                          border: pw.Border.all(color: alertCoral, width: 0.7),
                        ),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              '[!] CRITICAL GATE EXAM TRAPS TO AVOID:',
                              style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold, color: alertCoral),
                            ),
                            pw.SizedBox(height: 2),
                            ...proSec.examTraps.map(
                              (trap) => pw.Padding(
                                padding: const pw.EdgeInsets.only(bottom: 2),
                                child: pw.Row(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text('- ', style: pw.TextStyle(fontSize: 8, color: alertCoral, fontWeight: pw.FontWeight.bold)),
                                    pw.Expanded(
                                      child: pw.Text(
                                        _clean(trap),
                                        style: pw.TextStyle(fontSize: 7.5, color: brandDark, lineSpacing: 1.1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Solved Numerical
                    if (proSec.solvedExample.trim().isNotEmpty)
                      pw.Container(
                        width: double.infinity,
                        margin: const pw.EdgeInsets.only(top: 3, bottom: 5),
                        padding: const pw.EdgeInsets.all(6),
                        decoration: pw.BoxDecoration(
                          color: PdfColor.fromHex('#F0FDF4'),
                          borderRadius: pw.BorderRadius.circular(4),
                          border: pw.Border.all(color: accentMint, width: 0.7),
                        ),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              '[OK] SOLVED BENCHMARK NUMERICAL:',
                              style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold, color: accentMint),
                            ),
                            pw.SizedBox(height: 2),
                            pw.Text(
                              _clean(proSec.solvedExample.trim()),
                              style: pw.TextStyle(fontSize: 7.5, color: brandDark, lineSpacing: 1.15),
                            ),
                          ],
                        ),
                      ),

                    // Shortcut Tips
                    if (proSec.shortcutTips.isNotEmpty)
                      pw.Container(
                        width: double.infinity,
                        margin: const pw.EdgeInsets.only(top: 3, bottom: 8),
                        padding: const pw.EdgeInsets.all(6),
                        decoration: pw.BoxDecoration(
                          color: PdfColor.fromHex('#FFFBEB'),
                          borderRadius: pw.BorderRadius.circular(4),
                          border: pw.Border.all(color: PdfColor.fromHex('#F59E0B'), width: 0.7),
                        ),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              '[*] AIR-1 TOPPER SHORTCUT TIPS:',
                              style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold, color: PdfColor.fromHex('#B45309')),
                            ),
                            pw.SizedBox(height: 2),
                            ...proSec.shortcutTips.map(
                              (tip) => pw.Padding(
                                padding: const pw.EdgeInsets.only(bottom: 1.5),
                                child: pw.Row(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text('* ', style: pw.TextStyle(fontSize: 7.5, color: PdfColor.fromHex('#B45309'), fontWeight: pw.FontWeight.bold)),
                                    pw.Expanded(
                                      child: pw.Text(
                                        _clean(tip),
                                        style: pw.TextStyle(fontSize: 7.5, color: brandDark, lineSpacing: 1.1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ];
                }),
              ],
            ];
          },
        ),
      );

      final bytes = await doc.save();
      final outputDir = await getTemporaryDirectory();
      final sanitizedTitle = note.id.replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '_');
      final file = File('${outputDir.path}/GateX_${sanitizedTitle}_Notes.pdf');
      await file.writeAsBytes(bytes, flush: true);

      final xFile = XFile(file.path, mimeType: 'application/pdf');
      final result = await Share.shareXFiles(
        [xFile],
        text: 'GateX Preparation Notes: ${note.title}',
        subject: 'GateX Notes - ${note.title}',
      );

      return result.status == ShareResultStatus.success || result.status == ShareResultStatus.dismissed;
    } catch (e) {
      debugPrint('Error generating/sharing PDF: $e');
      return false;
    }
  }
}
