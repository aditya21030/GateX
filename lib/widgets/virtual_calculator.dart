import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import '../theme/app_theme.dart';

class VirtualCalculator extends StatefulWidget {
  final bool isDialog;
  const VirtualCalculator({super.key, this.isDialog = false});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.2),
      builder: (context) => const Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(12),
        child: VirtualCalculator(isDialog: true),
      ),
    );
  }

  @override
  State<VirtualCalculator> createState() => _VirtualCalculatorState();
}

class _VirtualCalculatorState extends State<VirtualCalculator> {
  String _expression = '';
  String _result = '';
  Offset _dragOffset = Offset.zero;
  double _opacity = 0.96;
  bool _isMinimized = false;
  bool _isDegreeMode = true;

  final List<List<String>> _buttons = [
    ['sin', 'cos', 'tan', 'C'],
    ['asin', 'acos', 'atan', '⌫'],
    ['log', 'ln', 'e', 'π'],
    ['√', '^', '(', ')'],
    ['7', '8', '9', '/'],
    ['4', '5', '6', '*'],
    ['1', '2', '3', '-'],
    ['0', '.', '=', '+'],
  ];

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _expression = '';
        _result = '';
      } else if (buttonText == '⌫') {
        if (_expression.isNotEmpty) {
          _expression = _expression.substring(0, _expression.length - 1);
        }
      } else if (buttonText == '=') {
        _evaluateExpression();
      } else if (buttonText == '√') {
        _expression += 'sqrt(';
      } else if (buttonText == 'π') {
        _expression += '3.14159265359';
      } else if (buttonText == 'e') {
        _expression += '2.71828182846';
      } else if (['sin', 'cos', 'tan', 'asin', 'acos', 'atan', 'log', 'ln'].contains(buttonText)) {
        _expression += '$buttonText(';
      } else {
        _expression += buttonText;
      }
    });
  }

  void _evaluateExpression() {
    try {
      String evalExpr = _expression.replaceAll('×', '*').replaceAll('÷', '/');

      // 1. Rewrite single-arg log(x) to base-10 log: (ln(x)/ln(10))
      evalExpr = evalExpr.replaceAllMapped(
        RegExp(r'log\(([^,\)]+)\)'),
        (match) => '(ln(${match.group(1)})/ln(10))',
      );

      // 2. Translate asin/acos/atan into arcsin/arccos/arctan for math_expressions parser
      evalExpr = evalExpr
          .replaceAll('asin(', 'arcsin(')
          .replaceAll('acos(', 'arccos(')
          .replaceAll('atan(', 'arctan(');

      // 3. Degree mode conversion for trig functions
      if (_isDegreeMode) {
        const double degToRad = 0.017453292519943295; // pi / 180
        const double radToDeg = 57.29577951308232;   // 180 / pi

        evalExpr = evalExpr.replaceAllMapped(
          RegExp(r'\b(sin|cos|tan)\(([^,\)]+)\)'),
          (m) => '${m.group(1)}((${m.group(2)}) * $degToRad)',
        );

        evalExpr = evalExpr.replaceAllMapped(
          RegExp(r'\b(arcsin|arccos|arctan)\(([^,\)]+)\)'),
          (m) => '(${m.group(1)}(${m.group(2)}) * $radToDeg)',
        );
      }

      final parser = ShuntingYardParser();
      final exp = parser.parse(evalExpr);
      final cm = ContextModel();
      // ignore: deprecated_member_use
      final double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Format to up to 8 decimal places to eliminate floating point noise (e.g. 0.49999999999999994)
      final double rounded = double.parse(eval.toStringAsFixed(8));
      _result = rounded.toString();
      if (_result.endsWith('.0')) {
        _result = _result.substring(0, _result.length - 2);
      }
    } catch (e) {
      _result = 'Error';
    }
  }

  void _cycleOpacity() {
    setState(() {
      if (_opacity >= 0.95) {
        _opacity = 0.75;
      } else if (_opacity >= 0.7) {
        _opacity = 0.50;
      } else {
        _opacity = 0.96;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double cardWidth = widget.isDialog ? 340 : double.infinity;
    final double screenH = MediaQuery.of(context).size.height;
    final double cardHeight = _isMinimized
        ? 90
        : (widget.isDialog
            ? min(500.0, screenH * 0.80)
            : screenH * 0.72);

    final content = Transform.translate(
      offset: _dragOffset,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: _opacity,
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: context.colorSurface,
            borderRadius: BorderRadius.circular(widget.isDialog ? 20 : 0),
            border: Border.all(color: AppTheme.secondary.withValues(alpha: 0.3), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.45),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. DRAGGABLE TOP GRIP & CONTROLS
              GestureDetector(
                onPanUpdate: widget.isDialog
                    ? (details) {
                        setState(() {
                          _dragOffset += details.delta;
                        });
                      }
                    : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.background.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(widget.isDialog ? 18 : 0)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.drag_indicator_rounded, color: AppTheme.textSecondary, size: 18),
                      const SizedBox(width: 8),
                      const Text(
                        'GATE Calculator',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      // DEG / RAD Mode Toggle Pill
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.selectionClick();
                          setState(() {
                            _isDegreeMode = !_isDegreeMode;
                            if (_expression.isNotEmpty) {
                              _evaluateExpression();
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                          decoration: BoxDecoration(
                            color: _isDegreeMode
                                ? const Color(0xFFFF8522).withValues(alpha: 0.18)
                                : AppTheme.accentPurple.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: _isDegreeMode ? const Color(0xFFFF8522) : AppTheme.accentPurple,
                              width: 0.8,
                            ),
                          ),
                          child: Text(
                            _isDegreeMode ? 'DEG' : 'RAD',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: _isDegreeMode ? const Color(0xFFFF8522) : AppTheme.accentPurple,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Opacity button
                      IconButton(
                        icon: const Icon(Icons.opacity_rounded, size: 18),
                        color: _opacity < 0.9 ? AppTheme.secondary : AppTheme.textSecondary,
                        tooltip: 'Toggle Transparency',
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                        onPressed: _cycleOpacity,
                      ),
                      // Minimize/Expand button
                      IconButton(
                        icon: Icon(_isMinimized ? Icons.expand_more_rounded : Icons.expand_less_rounded, size: 20),
                        color: AppTheme.textSecondary,
                        tooltip: _isMinimized ? 'Expand' : 'Minimize',
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                        onPressed: () {
                          setState(() => _isMinimized = !_isMinimized);
                        },
                      ),
                      // Close button
                      if (widget.isDialog)
                        IconButton(
                          icon: const Icon(Icons.close_rounded, size: 18),
                          color: AppTheme.textSecondary,
                          tooltip: 'Close',
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: () => Navigator.pop(context),
                        ),
                    ],
                  ),
                ),
              ),

              // 2. LCD DISPLAY
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _expression.isEmpty ? '0' : _expression,
                      style: TextStyle(fontSize: 18, color: context.textColor.withValues(alpha: 0.7)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _result.isEmpty ? '0' : _result,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.secondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              if (!_isMinimized) ...[
                const Divider(height: 1, color: Colors.white12),
                // 3. SCIENTIFIC KEYPAD
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: _buttons.map((row) {
                        return Expanded(
                          child: Row(
                            children: row.map((btnText) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.5),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _getButtonColor(btnText, context),
                                      foregroundColor: _getTextColor(btnText, context),
                                      padding: EdgeInsets.zero,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () => _onButtonPressed(btnText),
                                    child: Text(
                                      btnText,
                                      style: TextStyle(
                                        fontSize: btnText.length > 2 ? 12 : 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    if (widget.isDialog) {
      return content;
    }
    return content;
  }

  Color _getButtonColor(String btn, BuildContext context) {
    if (btn == 'C' || btn == '⌫') return AppTheme.error.withValues(alpha: 0.25);
    if (btn == '=') return AppTheme.primary;
    if (['+', '-', '*', '/', '^'].contains(btn)) return AppTheme.secondary.withValues(alpha: 0.2);
    if (['sin', 'cos', 'tan', 'asin', 'acos', 'atan', 'log', 'ln', '√', 'e', 'π', '(', ')'].contains(btn)) {
      return AppTheme.background.withValues(alpha: 0.7);
    }
    return context.isDarkMode ? Colors.grey[850]! : Colors.grey[200]!;
  }

  Color _getTextColor(String btn, BuildContext context) {
    if (btn == 'C' || btn == '⌫') return AppTheme.error;
    if (btn == '=') return Colors.white;
    if (['+', '-', '*', '/', '^'].contains(btn)) return AppTheme.secondary;
    return context.textColor;
  }
}
