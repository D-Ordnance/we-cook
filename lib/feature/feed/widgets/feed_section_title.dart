import 'package:flutter/material.dart';

import '../../../core/widget/we_cook_semi_bold_text.dart';

class FeedSectionTitle extends StatelessWidget {
  final String title;
  const FeedSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: WeCookSemiBoldText(title: title),
        ),
        const Expanded(
            flex: 1,
            child: Text(
              "See all",
              textAlign: TextAlign.end,
              style: TextStyle(color: Color(0xFFEB5CF8)),
            ))
      ],
    );
  }
}
