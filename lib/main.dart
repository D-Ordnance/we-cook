import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:we_cook/feature/feed/pages/feed.dart';
import 'package:we_cook/feature/splash/pages/splash.dart';

import 'feature/chat/pages/chats.dart';

void main() {
  runApp(const Splash());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Cook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5F0566)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final _buildBody = [
  const Feeds(),
  const Chats(),
  const Chats(),
  const Chats(),
  const Chats()
];

class _MyHomePageState extends State<MyHomePage> {
  double angle = 0;
  bool _hasRotated = false;
  int _currentIndex = 0;
  int _middleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Euclid'),
      home: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          _buildBody[_currentIndex],
          Visibility(
            visible: _hasRotated,
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFE10bF4))),
                    child: const Image(
                      width: 30,
                      height: 30,
                      image: AssetImage('lib/images/edit.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: const Color(0xFFE10bF4))),
                          child: const Image(
                            width: 30,
                            height: 30,
                            image: AssetImage('lib/images/video.png'),
                          )),
                      const SizedBox(width: 50),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFE10bF4))),
                        child: const Image(
                          width: 30,
                          height: 30,
                          image: AssetImage('lib/images/videoplay.png'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2.0,
          iconSize: 30.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFFE10BF4),
          unselectedItemColor: const Color(0xFF272727),
          items: [
            const BottomNavigationBarItem(
                icon: Image(image: AssetImage('lib/images/home.png')),
                label: 'Feed',
                activeIcon:
                    Image(image: AssetImage('lib/images/active_home.png'))),
            const BottomNavigationBarItem(
                icon: Image(image: AssetImage('lib/images/messages.png')),
                label: 'Chats',
                activeIcon:
                    Image(image: AssetImage('lib/images/active_messages.png'))),
            BottomNavigationBarItem(
              icon: _middleIndex == 2 && _hasRotated
                  ? TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 200),
                      tween: Tween<double>(begin: 0, end: angle),
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateZ(value / 180 * math.pi),
                          child: child,
                        );
                      },
                      onEnd: () => _hasRotated = true,
                      child: const Image(
                        image: AssetImage('lib/images/addcircle.png'),
                      ))
                  : TweenAnimationBuilder(
                      tween: Tween<double>(begin: -45, end: angle),
                      duration: const Duration(milliseconds: 200),
                      builder: ((context, value, child) => Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateZ(value / 180 * math.pi),
                            child: child,
                          )),
                      onEnd: () => _hasRotated = false,
                      child: const Image(
                        image: AssetImage('lib/images/addcircle.png'),
                      ),
                    ),
              label: '',
            ),
            const BottomNavigationBarItem(
                icon: Image(image: AssetImage('lib/images/archive.png')),
                label: 'Bookmarks',
                activeIcon:
                    Image(image: AssetImage('lib/images/active_archive.png'))),
            const BottomNavigationBarItem(
                icon: Image(image: AssetImage('lib/images/profile.png')),
                label: 'Profile',
                activeIcon:
                    Image(image: AssetImage('lib/images/active_profile.png'))),
          ],
          onTap: (index) {
            setState(() {
              if (index == 2) {
                _middleIndex = index;
                if (_hasRotated) {
                  _hasRotated = false;
                  angle = 0;
                } else {
                  _hasRotated = true;
                  angle = -45;
                }
              } else {
                _currentIndex = index;
                _middleIndex = 0;
                _hasRotated = false;
                angle = 0;
              }
            });
          },
        ),
      ),
    );
  }
}
