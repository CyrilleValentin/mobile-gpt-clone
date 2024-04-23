
import 'package:flutter/material.dart';
import 'package:my_ai/configs/constant.dart';
import 'package:my_ai/pages/chat.dart';
import 'package:onboarding_screen/onboarding_screen.dart';

class Onboarding extends StatelessWidget {
 final PageController _controller = PageController();

  final List<_SliderModel> mySlides = [
    _SliderModel(
      imageAssetPath: Image.asset(
        im1,
        scale: 1,
      ),
      title: 'Developer Student Club',
      desc: 'discover people',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset(im1),
      title: 'Welcome to My Ai',
      desc: 'discover ai world',
    ),
   
  
  ];

  Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      label: const Text(
        'Get Started',
        key: Key('get_started'),
      ),

      /// This function works when you will complete `OnBoarding`
      function: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const Chat(),
          ),
        );
      },

      /// This [mySlides] must not be more than 5.
      mySlides: mySlides,
      controller: _controller,
      slideIndex: 0,
      statusBarColor: Colors.white,
      indicators: Indicators.cool,
      skipPosition: SkipPosition.bottomRight,
      skipDecoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      skipStyle: const TextStyle(color: Colors.white),

      pageIndicatorColorList: const [
        Colors.yellow,
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.blue
      ],
    );
  }
}

class _SliderModel {
  const _SliderModel({
    this.imageAssetPath,
    this.title = "title",
    this.desc = "title",
    this.miniDescFontSize = 12.0,
    this.minTitleFontSize = 15.0,
    this.descStyle,
    this.titleStyle,
  });

  final Image? imageAssetPath;
  final String title;
  final TextStyle? titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle? descStyle;
  final double miniDescFontSize;
}
