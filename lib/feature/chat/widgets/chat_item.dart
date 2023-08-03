import 'package:flutter/material.dart';
import 'package:we_cook/core/widget/we_cook_semi_bold_text.dart';

import '../../../core/widget/we_cook_regular_text.dart';

class ChatItem extends StatelessWidget {
  final String avatar;
  final String name;
  final String lastMessage;
  final String lastTimeStamp;
  final String messageStatusImage;
  final bool lastItem;
  const ChatItem(
      {super.key,
      required this.avatar,
      required this.name,
      required this.lastMessage,
      required this.lastTimeStamp,
      required this.messageStatusImage,
      required this.lastItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              height: 40,
              width: 40,
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
              image: AssetImage(avatar),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeCookSemiBoldText(
                    title: name,
                    fontSize: 16,
                  ),
                  WeCookRegularText(title: lastMessage)
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  WeCookRegularText(title: lastTimeStamp),
                  Image(image: AssetImage(messageStatusImage))
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: lastItem ? 0 : 16,
        ),
      ],
    );
  }
}
