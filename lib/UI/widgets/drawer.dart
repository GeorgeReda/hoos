import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:hoos/UI/routes/maps_sort.dart';
import 'package:hoos/UI/widgets/mod_list_tile.dart';
import 'package:hoos/constants.dart';

class ModDrawer extends StatelessWidget {
  ModDrawer({Key key, @required this.drawerKey, @required this.scaffold})
      : super(key: key);
  final Widget scaffold;
  final GlobalKey<InnerDrawerState> drawerKey;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InnerDrawer(
        key: drawerKey,
        borderRadius: 20,
        onTapClose: true,
        swipe: false,
        scaffold: scaffold,
        backgroundDecoration: BoxDecoration(color: Constants.LIGHT_BG_COLOR),
        rightChild: Container(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Constants.PRIMARY_COLOR,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(25))),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'سبحوه و زيدوه علواً إلى الأبد',
                      style: TextStyle(
                        fontSize: 20,
                        color: Constants.LIGHT_BG_COLOR,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'الهوس الثالث',
                      style: TextStyle(
                        fontSize: 14,
                        color: Constants.LIGHT_BG_COLOR,
                      ),
                    ),
                  ],
                )),
              ),
              _buildSeasons(),
              _buildLiturgies(),
              _buildTunes()
            ],
          ),
        ),
      ),
    );
  }

  ExpansionTile _buildSeasons() {
    List<String> seasons = [
      'سنوي',
      'عيد النيروز',
      'عيد الصليب',
      'شهر كيهك',
      'برمون الميلاد',
      'عيد الميلاد',
      'عيد الختان',
      'برمون الغطاس',
      'عيد الغطاس',
      'عرس قانا الجليل',
      'عيد دخول السيد المسيح الهيكل',
      'صوم نينوى و أيام الصوم الكبير',
      'سبوت و آحاد الصوم الكبير',
      'أحد الشعانين',
      'أسبوع الآلام',
      'سبت الفرح',
      'عيد القيامة',
      'عيد الصعود',
      'عيد حلول الروح القدس',
      'صوم الرسل',
      'عيد الرسل',
    ];
    List<ModListTile> tiles = [];
    seasons.forEach((element) {
      tiles.add(
          ModListTile(title: element, page: MapsSortScreen(title: element)));
    });
    return ExpansionTile(
      title: Text(
        'المواسم',
        style: TextStyle(
            color: Constants.ACCENT_COLOR, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
      ),
      children: tiles,
    );
  }
}

ExpansionTile _buildLiturgies() {
  List<String> tunes = [
    'صلاة رفع بخور عشية و باكر',
    'تسبحة نصف الليل',
    'القداس الإلهي',
  ];
  List<ModListTile> tiles = [];
  tunes.forEach((element) {
    tiles
        .add(ModListTile(title: element, page: MapsSortScreen(title: element)));
  });
  return ExpansionTile(
    title: Text(
      'الصلوات الليتورجية',
      style:
          TextStyle(color: Constants.ACCENT_COLOR, fontWeight: FontWeight.bold),
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    ),
    children: tiles,
  );
}

ExpansionTile _buildTunes() {
  List<String> tunes = [
    'الكيهكي',
    'الفرايحي',
    'الصيامي',
    'الشعانيني',
    'الحزايني',
    'السنوي',
  ];
  List<ModListTile> tiles = [];
  tunes.forEach((element) {
    tiles
        .add(ModListTile(title: element, page: MapsSortScreen(title: element)));
  });
  return ExpansionTile(
    title: Text(
      'أنواع الألحان',
      style:
          TextStyle(color: Constants.ACCENT_COLOR, fontWeight: FontWeight.bold),
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    ),
    children: tiles,
  );
}
