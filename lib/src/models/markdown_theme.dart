import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

abstract class MarkdownTheme {
  TextStyle get a;
  TextStyle get p;
  TextStyle get code;
  TextStyle get blockquote;
  BoxDecoration get blockquoteDecoration;
  EdgeInsetsGeometry get blockquotePadding;
  TextStyle get h1;
  TextStyle get h2;
  TextStyle get h3;
  TextStyle get h4;
  TextStyle get listBullet;
  double get listIndent;
}
