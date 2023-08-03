import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_cook/feature/chat/widgets/chat_item.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final chatItems = [
    {
      "avatar": "lib/images/chat_avatar_one.png",
      "name": "Lagatha_24",
      "lastMessage": "Yeah, I’ll be free by 3.",
      "lastTimeStamp": "05:51 am",
      "messageStatusImage": "lib/images/unread.png"
    },
    {
      "avatar": "lib/images/chat_avatar_two.png",
      "name": "silverlion355",
      "lastMessage": "Americano",
      "lastTimeStamp": "10:32 pm",
      "messageStatusImage": "lib/images/check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_three.png",
      "name": "whitefish664",
      "lastMessage": "Papa John's",
      "lastTimeStamp": "11:23 pm",
      "messageStatusImage": "lib/images/double_check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_four.png",
      "name": "sadwolf227",
      "lastMessage": "The Botanist",
      "lastTimeStamp": "05:49 pm",
      "messageStatusImage": "lib/images/check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_one.png",
      "name": "Lagatha_24",
      "lastMessage": "Yeah, I’ll be free by 3.",
      "lastTimeStamp": "05:51 am",
      "messageStatusImage": "lib/images/unread.png"
    },
    {
      "avatar": "lib/images/chat_avatar_two.png",
      "name": "silverlion355",
      "lastMessage": "Americano",
      "lastTimeStamp": "10:32 pm",
      "messageStatusImage": "lib/images/check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_three.png",
      "name": "whitefish664",
      "lastMessage": "Papa John's",
      "lastTimeStamp": "11:23 pm",
      "messageStatusImage": "lib/images/double_check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_four.png",
      "name": "sadwolf227",
      "lastMessage": "The Botanist",
      "lastTimeStamp": "05:49 pm",
      "messageStatusImage": "lib/images/check.png"
    },
  ];

  List<Map<String, String>> tempChatItems = [
    {
      "avatar": "lib/images/chat_avatar_one.png",
      "name": "Lagatha_24",
      "lastMessage": "Yeah, I’ll be free by 3.",
      "lastTimeStamp": "05:51 am",
      "messageStatusImage": "lib/images/unread.png"
    },
    {
      "avatar": "lib/images/chat_avatar_two.png",
      "name": "silverlion355",
      "lastMessage": "Americano",
      "lastTimeStamp": "10:32 pm",
      "messageStatusImage": "lib/images/check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_three.png",
      "name": "whitefish664",
      "lastMessage": "Papa John's",
      "lastTimeStamp": "11:23 pm",
      "messageStatusImage": "lib/images/double_check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_four.png",
      "name": "sadwolf227",
      "lastMessage": "The Botanist",
      "lastTimeStamp": "05:49 pm",
      "messageStatusImage": "lib/images/check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_one.png",
      "name": "Lagatha_24",
      "lastMessage": "Yeah, I’ll be free by 3.",
      "lastTimeStamp": "05:51 am",
      "messageStatusImage": "lib/images/unread.png"
    },
    {
      "avatar": "lib/images/chat_avatar_two.png",
      "name": "silverlion355",
      "lastMessage": "Americano",
      "lastTimeStamp": "10:32 pm",
      "messageStatusImage": "lib/images/check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_three.png",
      "name": "whitefish664",
      "lastMessage": "Papa John's",
      "lastTimeStamp": "11:23 pm",
      "messageStatusImage": "lib/images/double_check.png"
    },
    {
      "avatar": "lib/images/chat_avatar_four.png",
      "name": "sadwolf227",
      "lastMessage": "The Botanist",
      "lastTimeStamp": "05:49 pm",
      "messageStatusImage": "lib/images/check.png"
    },
  ];

  final _chatsTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  chatSearhSection(),
                  chatListSection(context),
                ]),
          ),
        ),
      ),
    );
  }

  Widget chatSearhSection() => Column(
        children: [
          const SizedBox(
            height: 72,
          ),
          TextField(
            controller: _chatsTextEditController,
            onChanged: (value) => filterChatList(value),
            decoration: const InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Color(0xFFBCBCBC)),
              prefixIcon: Image(image: AssetImage('lib/images/search.png')),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
        ],
      );

  Widget chatListSection(BuildContext context) =>
      _chatsTextEditController.text.isNotEmpty && tempChatItems.isEmpty
          ? emptySerachResult()
          : tempChatItems.isNotEmpty
              ? serachResult(context, tempChatItems)
              : const Center();

  Widget emptySerachResult() => const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search_off,
                  size: 80,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    'No results found,\nPlease try different keyword',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget serachResult(BuildContext context, List<Map<String, String>> items) =>
      Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) => ChatItem(
                  avatar: items[index]["avatar"]!,
                  name: items[index]["name"]!,
                  lastMessage: items[index]["lastMessage"]!,
                  lastTimeStamp: items[index]["lastTimeStamp"]!,
                  messageStatusImage: items[index]["messageStatusImage"]!,
                  lastItem: items.length - 1 == index))
        ],
      );

  void filterChatList(String value) {
    setState(() {
      tempChatItems = chatItems
          .where((element) =>
              element["name"]!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
