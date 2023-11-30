import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_markdown/flutter_markdown.dart';

import '../state/inherited_chat_theme.dart';
import '../state/inherited_user.dart';
import 'user_name.dart';

class MarkdownTextMessage extends StatelessWidget {
  const MarkdownTextMessage({
    super.key,
    required this.message,
    required this.showName,
    this.nameBuilder,
  });

  final types.TextMessage message;
  final Widget Function(types.User)? nameBuilder;
  final bool showName;

  @override
  Widget build(BuildContext context) {
    final theme = InheritedChatTheme.of(context).theme;

    final user = InheritedUser.of(context).user;
    final bodyStyle = user.id == message.author.id
        ? theme.sentMessageBodyTextStyle
        : theme.receivedMessageBodyTextStyle;

    final codeBgColor = const Color(0xFF37D9DF)
        .withOpacity(0.2)
        .withRed(60)
        .withGreen(60)
        .withBlue(60);

    final codeStyle = TextStyle(
      fontFamily: 'monospace',
      fontSize: 14.0,
      color: Colors.white,
      backgroundColor: codeBgColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.2,
    );

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
            styleSheet: MarkdownStyleSheet(
              p: bodyStyle,
              code: codeStyle,
            ),
          ),
        ],
      ),
    );
  }
}
