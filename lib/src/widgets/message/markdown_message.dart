import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../models/markdown_theme.dart';
import '../state/inherited_chat_theme.dart';
import 'user_name.dart';

class MarkdownTextMessage extends StatelessWidget {
  const MarkdownTextMessage({
    super.key,
    required this.message,
    required this.showName,
    required this.markdownTheme,
    this.nameBuilder,
  });

  final types.TextMessage message;
  final MarkdownTheme markdownTheme;
  final Widget Function(types.User)? nameBuilder;
  final bool showName;

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
            styleSheet: markdownTheme.toMarkdownStyleSheet(),
          ),
        ],
      ),
    );
  }
}
