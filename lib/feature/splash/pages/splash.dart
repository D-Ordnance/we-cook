import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:we_cook/core/widget/we_cook_bold_text.dart';
import 'package:we_cook/feature/splash/state_manager/splash_state_manager.dart';
import 'package:we_cook/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  InitAppState initAppState = InitAppState();
  @override
  void initState() {
    super.initState();
    initAppState.eventSink.add(InitAppActions.InitApp);
  }

  @override
  Widget build(BuildContext context) {
    const String assetName = 'lib/images/logo.svg';
    final Widget svg = SvgPicture.asset(
        width: 70, height: 70, assetName, semanticsLabel: 'Acme Logo');
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                svg,
                const SizedBox(
                  height: 12,
                ),
                const WeCookBoldText(
                  title: "WeCook",
                  fontSize: 24,
                ),
                StreamBuilder<void>(
                    stream: null,
                    builder: (context, snapshot) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ),
                        ),
                      );
                      return const Row(
                        children: [],
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
