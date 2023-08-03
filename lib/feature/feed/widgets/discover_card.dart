import 'package:flutter/material.dart';

import '../../../core/widget/we_cook_regular_text.dart';
import '../../../core/widget/we_cook_semi_bold_text.dart';

class DiscoverCard extends StatelessWidget {
  final String backgroundImage;
  final String nameAndAge;
  final String location;
  final bool lastItem;
  const DiscoverCard({
    super.key,
    required this.backgroundImage,
    required this.nameAndAge,
    required this.location,
    required this.lastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
                image: AssetImage(backgroundImage), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                const Expanded(
                  flex: 3,
                  child: Image(
                      alignment: Alignment.topRight,
                      image: AssetImage('lib/images/discover_new.png')),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WeCookSemiBoldText(
                        title: nameAndAge,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      WeCookRegularText(
                        title: location,
                        fontSize: 12,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: lastItem ? 0 : 16,
        )
      ],
    );
  }
}
