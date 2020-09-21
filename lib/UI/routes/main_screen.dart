import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:hoos/UI/routes/search.dart';
import 'package:hoos/UI/routes/settings_screen.dart';
import 'package:hoos/UI/widgets/drawer.dart';
import 'package:hoos/constants.dart';

import 'latest_maps.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<InnerDrawerState> _drawerKey = GlobalKey<InnerDrawerState>();
  int _currentIndex = 2;
  PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModDrawer(
        drawerKey: _drawerKey,
        scaffold: Scaffold(
          body: SafeArea(
            child: PageView(
              controller: _controller,
              physics: PageScrollPhysics(),
              onPageChanged: (index) => setState(() => _currentIndex = index),
              children: <Widget>[
                SettingsScreen(),
                SearchPage(),
                LatestMapsScreen(drawerKey: _drawerKey),
              ],
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Constants.PRIMARY_COLOR),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.shifting,
              items: Constants().bottomNavBarItems,
              onTap: (index) {
                setState(() => _currentIndex = index);
                _controller.jumpToPage(_currentIndex);
              },
            ),
          ),
        ));
  }
}
