import 'package:chattie/config/theme.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final bool isSender;

  ChatItem(this.isSender);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: isSender ? 50 : DEFAULT_MARGIN,
        right: !isSender ? 50 : DEFAULT_MARGIN,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: !isSender
                ? const Radius.circular(2)
                : const Radius.circular(12),
            topRight:
                isSender ? const Radius.circular(2) : const Radius.circular(12),
            bottomLeft: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
          color: !isSender ? greyColor : primaryColor,
        ),
        child: Text(
          'Hallo guys, Apa kabar semuanya nih sehat-sehat aj kan?',
          style: !isSender
              ? blackColorStyle.copyWith(
                  fontSize: 16,
                )
              : whiteColorStyle.copyWith(
                  fontSize: 16,
                ),
        ),
      ),
    );
  }
}
