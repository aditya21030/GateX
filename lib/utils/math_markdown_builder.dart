import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_math_fork/flutter_math.dart';
import '../theme/app_theme.dart';

// Syntax parser for $math$
class InlineMathSyntax extends md.InlineSyntax {
  InlineMathSyntax() : super(r'\$([^\$]+)\$');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    parser.addNode(md.Element.text('math', match[1] ?? ''));
    return true;
  }
}

// Syntax parser for $$math$$
class BlockMathSyntax extends md.BlockSyntax {
  @override
  RegExp get pattern => RegExp(r'^\$\$');

  @override
  md.Node parse(md.BlockParser parser) {
    var childLines = <String>[];
    parser.advance();
    
    while (!parser.isDone) {
      if (pattern.hasMatch(parser.current.content)) {
        parser.advance();
        break;
      }
      childLines.add(parser.current.content);
      parser.advance();
    }
    
    return md.Element.text('block_math', childLines.join('\n'));
  }
}

// Builder for inline math
class MathElementBuilder extends MarkdownElementBuilder {
  final Color? color;
  MathElementBuilder({this.color});

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final effectiveColor = color ?? preferredStyle?.color ?? AppTheme.textPrimary;
    return Math.tex(
      element.textContent,
      mathStyle: MathStyle.text,
      textStyle: TextStyle(
        fontSize: preferredStyle?.fontSize ?? 14,
        color: effectiveColor,
      ),
      onErrorFallback: (err) => Text(
        '\$${element.textContent}\$',
        style: TextStyle(color: AppTheme.error, fontSize: preferredStyle?.fontSize ?? 14),
      ),
    );
  }
}

// Builder for block math
class BlockMathElementBuilder extends MarkdownElementBuilder {
  final Color? color;
  BlockMathElementBuilder({this.color});

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final effectiveColor = color ?? preferredStyle?.color ?? AppTheme.textPrimary;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Math.tex(
          element.textContent,
          mathStyle: MathStyle.display,
          textStyle: TextStyle(
            fontSize: (preferredStyle?.fontSize ?? 14) + 1,
            color: effectiveColor,
          ),
          onErrorFallback: (err) => Text(
            '\$\$${element.textContent}\$\$',
            style: TextStyle(color: AppTheme.error, fontSize: preferredStyle?.fontSize ?? 14),
          ),
        ),
      ),
    );
  }
}
