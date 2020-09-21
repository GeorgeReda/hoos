import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoos/UI/widgets/settings_list_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإعدادات', style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ReusableListTile(
                title: 'حول التطبيق',
                icon: Icons.info,
                onTap: () => Get.dialog(AboutDialog(
                    applicationIcon: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/church1.jpg',
                        height: 50,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                    ),
                    applicationName: 'Hoos || هوس',
                    children: <Widget>[
                      Text(
                        'هوس هو تطبيق يحتوى على خرائط هزات معظم ألحان الكنيسة القبطية الأرثوذكسية ل لتسهيل حفظ الألحان و الإستعانة به في جميع الأوقات',
                        textAlign: TextAlign.right,
                      ),
                      Text(
                          'Copyright George Reda Aiad.\nAll Rights Reserved 2020 ©')
                    ],
                    applicationVersion: '1.0.0')))
          ],
        ),
      ),
    );
  }
}
