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

  MarkdownStyleSheet get sheet => MarkdownStyleSheet(
        a: aStyle,
        p: pStyle,
        code: codeStyle,
        blockquote: blockquoteStyle,
        blockquoteDecoration: blockquoteDecoration,
        blockquotePadding: blockquotePadding,
        h1: h1Style,
        h2: h2Style,
        h3: h3Style,
        h4: h4Style,
        listBullet: listBulletStyle,
        listIndent: listIndent,
      );
}
