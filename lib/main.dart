import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoos/UI/routes/onborading.dart';
import 'package:hoos/constants.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('latest');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hoos',
      theme: Constants().lightTheme,
      home: OnBoarding(),
    );
  }
}
