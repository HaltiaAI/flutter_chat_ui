import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_markdown/flutter_markdown.dart';

import '../state/inherited_chat_theme.dart';
import 'user_name.dart';

class MarkdownTextMessage extends StatelessWidget {
  const MarkdownTextMessage({
    super.key,
    required this.message,
    this.nameBuilder,
    required this.showName,
  });

  final types.TextMessage message;
  final Widget Function(types.User)? nameBuilder;
  final bool showName;

  MarkdownStyleSheet _customMarkdownStyleSheet(BuildContext context) =>
      MarkdownStyleSheet(
        a: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ), // Links
        p: const TextStyle(fontSize: 16.0, color: Colors.black87), // Paragraphs
        code: TextStyle(
          backgroundColor: Colors.grey[200],
          fontFamily: 'monospace',
          fontSize: 14.0,
        ), // Inline code.
        blockquote: TextStyle(color: Colors.grey[600]), // Blockquotes
        blockquoteDecoration: BoxDecoration(
          color: Colors.grey[100],
          border:
              Border(left: BorderSide(color: Colors.grey[300]!, width: 4.0)),
        ),
        blockquotePadding: const EdgeInsets.all(10.0),
        h1: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ), // Heading 1
        h2: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ), // Heading 2
        h3: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ), // Heading 3
        h4: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ), // Heading 4
        listBullet:
            const TextStyle(fontSize: 16.0, color: Colors.red), // Bullet lists
        listIndent: 24.0, // Indentation for lists
        // Add other styles as needed...
      );

  @override
  Widget build(BuildContext context) {
    final theme = InheritedChatTheme.of(context).theme;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: theme.messageInsetsHorizontal,
        vertical: theme.messageInsetsVertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showName)
            nameBuilder?.call(message.author) ??
                UserName(author: message.author),
          MarkdownBody(
            data: message.text,
            // TODO: We probably need to set up whole new color & style theme
            styleSheet: _customMarkdownStyleSheet(context),
          ),
        ],
      ),
    );
  }
}
