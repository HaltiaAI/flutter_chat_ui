import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownStyle {
  MarkdownStyle({
    required this.aStyle,
    required this.pStyle,
    required this.codeStyle,
    required this.blockquoteStyle,
    required this.blockquoteDecoration,
    required this.blockquotePadding,
    required this.h1Style,
    required this.h2Style,
    required this.h3Style,
    required this.h4Style,
    required this.listBulletStyle,
    required this.listIndent,
  });

  final TextStyle aStyle;
  final TextStyle pStyle;
  final TextStyle codeStyle;
  final TextStyle blockquoteStyle;
  final BoxDecoration blockquoteDecoration;
  final EdgeInsets? blockquotePadding;
  final TextStyle h1Style;
  final TextStyle h2Style;
  final TextStyle h3Style;
  final TextStyle h4Style;
  final TextStyle listBulletStyle;
  final double listIndent;

  MarkdownStyleSheet sheet(
    TextStyle pStyle,
    TextStyle codeStyle,
  ) =>
      MarkdownStyleSheet(
        p: pStyle,
        code: codeStyle,
      );
}
