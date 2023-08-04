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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      const WeCookRegularText(
                        title: "You accepted the request",
                        fontSize: 10,
                        color: Color(0xFF9C9C9C),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Image(
                          image: AssetImage("lib/images/chat_profile.png")),
                      const SizedBox(
                        height: 12,
                      ),
                      const WeCookRegularText(title: "Lagatha Lestrange"),
                      const SizedBox(
                        height: 4,
                      ),
                      WeCookRegularText(
                        title: title,
                        fontSize: 10,
                        color: const Color(0xFF9C9C9C),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFCE7FE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: const WeCookSemiBoldText(
                          title: "View Profile",
                          color: Color(0xFFE10BF4),
                          fontSize: 10,
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                bottom: 16.0, left: 16.0, right: 16.0, top: 8.0),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(
                      left: 12, top: 6, bottom: 6, right: 12),
                  decoration: const BoxDecoration(
                      color: Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage('lib/images/attachcircle.png'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                              fontFamily: "Euclid",
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          minLines: 1,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: "Message $title",
                            hintStyle:
                                const TextStyle(color: Color(0xFFBCBCBC)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Image(
                        image: AssetImage('lib/images/emoji.png'),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Image(
                        image: AssetImage('lib/images/microphone.png'),
                      ),
                    ],
                  ),
                )),
                const SizedBox(
                  width: 11,
                ),
                const Image(image: AssetImage('lib/images/send.png'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
