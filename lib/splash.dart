import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String id = 'splash_screen';

  @override
  Widget build(BuildContext context) {

    const colorizeColors = [
      Colors.white,
      Colors.grey,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 30.0,
      fontFamily: 'Horizon',
    );

    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/splash.png',
              ),
              SizedBox(height: 10,),
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Buy, Sell or Rent',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                  },
              ),

            ],
          )
      ),
    );
  }
}
