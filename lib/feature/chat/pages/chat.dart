import 'package:flutter/material.dart';
import 'package:we_cook/core/widget/we_cook_regular_text.dart';

import '../../../core/widget/we_cook_semi_bold_text.dart';

class Chat extends StatelessWidget {
  const Chat({super.key, required this.title, required this.avatar});

  final String title, avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image(
              image: AssetImage(avatar),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeCookSemiBoldText(title: title),
                const WeCookRegularText(
                  title: "Active now",
                  fontSize: 10,
                )
              ],
            )
          ],
        ),
        actions: const [
          Image(image: AssetImage('lib/images/call.png')),
          Image(image: AssetImage('lib/images/app_bar_video.png')),
          Image(image: AssetImage('lib/images/more.png')),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: []),
        ),
      ),
    );
  }
}
