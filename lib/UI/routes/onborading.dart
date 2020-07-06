import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoos/UI/routes/main_screen.dart';
import 'package:hoos/constants.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 24.0),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Constants.PRIMARY_COLOR,
      imagePadding: EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 30),
    );
    return IntroductionScreen(
      key: introKey,
      curve: Curves.linear,
      globalBackgroundColor: Constants.PRIMARY_COLOR,
      onDone: () => Get.off(MainScreen()),
      done: Text('Done',
          style: Get.textTheme.button.copyWith(fontWeight: FontWeight.w600)),
      next: Text('Next',
          style: Get.textTheme.button.copyWith(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(activeColor: Constants.LIGHT_BG_COLOR),
      pages: [
        PageViewModel(
            title: '♰',
            body: 'باسم الآب و الإبن و الروح القدس\nإله واحد آمين',
            image: Center(
              child: ClipRRect(
                  child: Image.asset(
                'images/church.jpg',
                height: Get.height / 2,
                fit: BoxFit.fill,
              )),
            ),
            decoration: pageDecoration),
        PageViewModel(
            title: '♰',
            body: 'خرائط الهزات لكل ألحان الكنيسة',
            image: Center(
              child: Image.asset(
                'images/church1.jpg',
                height: Get.height / 2,
                fit: BoxFit.fill,
              ),
            ),
            decoration: pageDecoration),
        PageViewModel(
            title: '♰',
            body: 'مصادر متنوعة لعدد كبير من الألحان',
            image: Center(
              child: Image.asset(
                'images/church2.jpg',
                height: Get.height / 2,
                fit: BoxFit.fill,
              ),
            ),
            decoration: pageDecoration),
        PageViewModel(
            title: '♰',
            body: 'الألحان مسموعة من أكتر من مصدر',
            image: Center(
              child: Image.asset(
                'images/church2.jpg',
                height: Get.height / 2,
                fit: BoxFit.fill,
              ),
            ),
            decoration: pageDecoration),
      ],
    );
  }
}
