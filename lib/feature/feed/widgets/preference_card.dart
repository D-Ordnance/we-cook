import 'package:flutter/material.dart';

import '../../../core/widget/we_cook_regular_text.dart';
import '../../../core/widget/we_cook_semi_bold_text.dart';

class PreferenceCard extends StatelessWidget {
  final String image;
  final String name;
  final String role;
  final bool lastItem;
  const PreferenceCard({
    super.key,
    required this.image,
    required this.name,
    required this.role,
    required this.lastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 164,
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
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image(
                    width: 165,
                    height: 100,
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, right: 8.0),
                    child: Image(image: AssetImage('lib/images/x_circle.png')),
                  ),
                ],
              ),
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      WeCookSemiBoldText(title: name),
                      WeCookRegularText(title: role),
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
                            title: "Send friend request",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
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
