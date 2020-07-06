import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoos/UI/routes/onborading.dart';
import 'package:hoos/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Material App',
      theme: Constants().lightTheme,
      home: OnBoarding(),
    );
  }
}
