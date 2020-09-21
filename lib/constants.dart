import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constants {
  static const Map<int, Color> PRIMARY_SWATCH = {
    50: Color.fromRGBO(145, 11, 2, .1),
    100: Color.fromRGBO(145, 11, 2, .2),
    200: Color.fromRGBO(145, 11, 2, .3),
    300: Color.fromRGBO(145, 11, 2, .4),
    400: Color.fromRGBO(145, 11, 2, .5),
    500: Color.fromRGBO(145, 11, 2, .6),
    600: Color.fromRGBO(145, 11, 2, .7),
    700: Color.fromRGBO(145, 11, 2, .8),
    800: Color.fromRGBO(145, 11, 2, .9),
    900: Color.fromRGBO(145, 11, 2, 1),
  };

  static const PRIMARY_COLOR = Color(0xff910b02);
  static const ACCENT_COLOR = Color(0xff35342f);
  static const LIGHT_BG_COLOR = Color(0xfff6e8c7);
  static const TextStyle style = TextStyle(color: LIGHT_BG_COLOR);
  static const Widget circularProgressIndicator = Center(
    child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(PRIMARY_COLOR)),
  );
  final ThemeData lightTheme = ThemeData(
      accentColor: ACCENT_COLOR,
      accentColorBrightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: LIGHT_BG_COLOR),
        iconTheme: IconThemeData(color: LIGHT_BG_COLOR),
      ),
      dialogTheme: const DialogTheme(backgroundColor: LIGHT_BG_COLOR),
      dividerTheme: const DividerThemeData(
          color: Color(0xffd2d0b9), indent: 20, endIndent: 20, thickness: 2),
      primarySwatch: const MaterialColor(0xff910b02, PRIMARY_SWATCH),
      primaryColor: PRIMARY_COLOR,
      primaryColorBrightness: Brightness.light,
      scaffoldBackgroundColor: LIGHT_BG_COLOR,
      iconTheme: const IconThemeData(color: LIGHT_BG_COLOR),
      textTheme: const TextTheme(
          headline6: style,
          button: style,
          bodyText1: style,
          bodyText2: style,
          caption: style,
          subtitle1: style,
          subtitle2: style));
  final List<BottomNavigationBarItem> bottomNavBarItems = const [
    BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.cog,
          color: LIGHT_BG_COLOR,
        ),
        title: Text(
          'الإعدادات',
          style: TextStyle(color: LIGHT_BG_COLOR),
        )),
    BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.search,
          color: LIGHT_BG_COLOR,
        ),
        title: Text(
          'البحث',
          style: TextStyle(color: LIGHT_BG_COLOR),
        )),
    BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.newspaper,
          color: LIGHT_BG_COLOR,
        ),
        title: Text(
          'الخرائط',
          style: TextStyle(color: LIGHT_BG_COLOR),
        )),
  ];
  static DrawerHeader buildDrawerHeader(String title) {
    return DrawerHeader(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
