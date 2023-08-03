import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_cook/core/widget/we_cook_bold_text.dart';
import 'package:we_cook/core/widget/we_cook_regular_text.dart';
import 'package:we_cook/core/widget/we_cook_semi_bold_text.dart';
import 'package:we_cook/feature/feed/widgets/preference_card.dart';

import '../widgets/currently_live_card.dart';
import '../widgets/discover_card.dart';
import '../widgets/feed_section_title.dart';

class Feeds extends StatelessWidget {
  const Feeds({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverItems = [
      {
        "backgroundImage": "lib/images/discover_image_one.png",
        "nameAndAge": "Sammy Zayri.22",
        "location": "SOUTHAMPTON"
      },
      {
        "backgroundImage": "lib/images/discover_image_two.png",
        "nameAndAge": "Clara Simps.25",
        "location": "LONDON"
      },
      {
        "backgroundImage": "lib/images/discover_image_three.png",
        "nameAndAge": "Joshzy.19",
        "location": "FLORIDA"
      },
      {
        "backgroundImage": "lib/images/discover_image_one.png",
        "nameAndAge": "Sammy Zayri.22",
        "location": "SOUTHAMPTON"
      },
      {
        "backgroundImage": "lib/images/discover_image_two.png",
        "nameAndAge": "Clara Simps.25",
        "location": "LONDON"
      }
    ];

    final preferenceItems = [
      {
        "image": "lib/images/preference_one.png",
        "name": "Nini Cho",
        "role": "Chief chef, Nini pastries"
      },
      {
        "image": "lib/images/preference_two.png",
        "name": "Usman Ali",
        "role": "Seus chef, Al-am eatry"
      },
    ];

    final currentlyLiveItems = [
      {
        "image": "lib/images/current_image_one.png",
        "avatar": "lib/images/current_avatar_one.png",
        "name": "Freddy_cooker",
        "location": "Florida . Currently live",
        "topic": "Outdoor cooks",
        "detail":
            "I’ll be showing how I prepare outdoor meals at home with my friends."
      },
      {
        "image": "lib/images/current_image_one.png",
        "avatar": "lib/images/current_avatar_one.png",
        "name": "Lilly ’n’ Tina",
        "location": "Texas . Currently live",
        "topic": "Veggie fries",
        "detail": "Lilly and Tina shows us a secret recipe on fried veggies"
      },
    ];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  feedHeaderSection(),
                  feedSearchSection(),
                  const FeedSectionTitle(title: "Discover"),
                  discoverSection(context, discoverItems),
                  const FeedSectionTitle(title: "Trending posts"),
                  trendingSection(context),
                  const FeedSectionTitle(title: "Based on your preferences"),
                  const SizedBox(
                    height: 16,
                  ),
                  preferenceSection(context, preferenceItems),
                  const SizedBox(
                    height: 16,
                  ),
                  const FeedSectionTitle(title: "Currently live"),
                  const SizedBox(
                    height: 16,
                  ),
                  currentlyLiveSection(context, currentlyLiveItems),
                  const SizedBox(
                    height: 16,
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget feedHeaderSection() {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeCookBoldText(
                    title: "Hello Dolapo",
                    fontSize: 16,
                  ),
                  WeCookRegularText(
                    title: "What do you want to cook with today?",
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Image(
                  alignment: Alignment.centerRight,
                  image: AssetImage('lib/images/notification.png')),
            )
          ],
        ),
      ],
    );
  }

  Widget feedSearchSection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: const Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Color(0xFFBCBCBC)),
                    prefixIcon:
                        Image(image: AssetImage('lib/images/search.png')),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Image(
                      image: AssetImage('lib/images/line.png'),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Image(image: AssetImage('lib/images/setting.png'))
                  ]))
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget discoverSection(
      BuildContext context, List<Map<String, String>> discoverItems) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 175,
              child: ListView.builder(
                itemCount: discoverItems.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return DiscoverCard(
                    backgroundImage: discoverItems[index]["backgroundImage"]!,
                    nameAndAge: discoverItems[index]["nameAndAge"]!,
                    location: discoverItems[index]["location"]!,
                    lastItem: discoverItems.length - 1 == index,
                  );
                }),
              ),
            )),
        const SizedBox(
          height: 16,
        ),
        Image(
            width: MediaQuery.of(context).size.width,
            image: const AssetImage('lib/images/horizontal_line.png')),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget trendingSection(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            const Row(
              children: [
                Image(image: AssetImage('lib/images/trending_avatar.png')),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeCookSemiBoldText(
                        title: 'Lagatha_24',
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      WeCookRegularText(
                        title: 'Florida . Jan 3rd, 12:14pm',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image(
                      alignment: Alignment.centerRight,
                      image: AssetImage('lib/images/Primary.png')),
                )
              ],
            ),
            const WeCookRegularText(
              title:
                  "My process for making birthday cakes, take a look, my recipe is attached to this post.",
              align: TextAlign.start,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 240,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('lib/images/trending_image.png'))),
              child: const Image(
                  alignment: Alignment.center,
                  image: AssetImage('lib/images/videocircle.png')),
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      WeCookBoldText(title: "299K "),
                      WeCookRegularText(title: "views "),
                      WeCookBoldText(title: ". 29K"),
                      WeCookRegularText(title: "likes"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WeCookBoldText(title: "11K "),
                      WeCookRegularText(title: "Comments "),
                      WeCookBoldText(title: ". 2.5K"),
                      WeCookRegularText(title: "Downloads"),
                    ],
                  ),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 1,
                    child: Image(
                        alignment: Alignment.centerLeft,
                        image: AssetImage('lib/images/likes.png'))),
                Expanded(
                    flex: 1,
                    child: Image(
                        alignment: Alignment.center,
                        image: AssetImage('lib/images/message.png'))),
                Expanded(
                    flex: 1,
                    child: Image(
                        alignment: Alignment.center,
                        image: AssetImage('lib/images/download.png'))),
                Expanded(
                    flex: 1,
                    child: Image(
                        alignment: Alignment.center,
                        image: AssetImage('lib/images/share.png'))),
                Expanded(
                    flex: 1,
                    child: Image(
                        alignment: Alignment.centerRight,
                        image: AssetImage('lib/images/trending_archive.png'))),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget preferenceSection(
      BuildContext context, List<Map<String, String>> items) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) => PreferenceCard(
              image: items[index]["image"]!,
              name: items[index]["name"]!,
              role: items[index]["role"]!,
              lastItem: items.length - 1 == index)),
    );
  }

  Widget currentlyLiveSection(
      BuildContext context, List<Map<String, String>> items) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 356,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => CurrentlyLiveCard(
              image: items[index]["image"]!,
              avatar: items[index]["avatar"]!,
              name: items[index]["name"]!,
              location: items[index]["location"]!,
              topic: items[index]["topic"]!,
              detail: items[index]["detail"]!,
              lastItem: items.length - 1 == index)),
    );
  }
}
