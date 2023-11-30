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

    final codeStyle = TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      letterSpacing: 1.2,
      wordSpacing: 2.0,
      textBaseline: TextBaseline.alphabetic,
      height: 1.5,
      shadows: const [
        Shadow(
          offset: Offset(2.0, 2.0),
          blurRadius: 3.0,
          color: Color(0x80000000),
        ),
      ],
      decoration: TextDecoration.underline,
      decorationColor: Colors.blue,
      decorationStyle: TextDecorationStyle.dashed,
      decorationThickness: 1.5,
      fontFamily: 'Roboto',
      background: Paint()..color = Colors.black,
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
