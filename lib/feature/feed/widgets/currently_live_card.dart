import 'package:flutter/material.dart';

import '../../../core/widget/we_cook_regular_text.dart';
import '../../../core/widget/we_cook_semi_bold_text.dart';

class CurrentlyLiveCard extends StatelessWidget {
  final String image;
  final String avatar;
  final String name;
  final String location;
  final String topic;
  final String detail;
  final bool lastItem;
  const CurrentlyLiveCard({
    super.key,
    required this.image,
    required this.avatar,
    required this.name,
    required this.location,
    required this.topic,
    required this.detail,
    required this.lastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 265,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 8,
                  offset: const Offset(0, 3))
            ],
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8)),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0))),
                  width: 265,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Image(
                            image: AssetImage(
                                'lib/images/current_avatar_one.png')),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WeCookSemiBoldText(
                              title: name,
                              align: TextAlign.start,
                            ),
                            WeCookRegularText(
                              title: location,
                              fontSize: 10,
                              align: TextAlign.start,
                              color: Color(0xFF6E6E6E),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 3,
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image(
                      width: 265,
                      image: AssetImage('lib/images/current_image_one.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Image(
                          image: AssetImage('lib/images/currently_live.png')),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 265,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 25.0, bottom: 10.0),
                    child: Column(
                      children: [
                        WeCookSemiBoldText(title: topic),
                        WeCookRegularText(title: detail),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 117,
                          decoration: const BoxDecoration(
                              color: Color(0xFFE10BF4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: WeCookRegularText(
                              title: "Request to join",
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: lastItem ? 0 : 16,
        )
      ],
    );
  }
}
