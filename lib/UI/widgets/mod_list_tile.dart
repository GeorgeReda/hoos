import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoos/constants.dart';

class ModListTile extends StatelessWidget {
  const ModListTile({Key key, @required this.title, @required this.page})
      : super(key: key);
  final String title;
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      iconColor: Constants.ACCENT_COLOR,
      textColor: Constants.ACCENT_COLOR,
      child: ListTile(
        title: Text(
          title,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        onTap: () => Get.to(page),
      ),
    );
  }
}
