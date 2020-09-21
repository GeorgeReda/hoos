import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoos/UI/widgets/map_tile.dart';

import '../../constants.dart';
import 'error_screen.dart';

class LatestMapsScreen extends StatelessWidget {
  LatestMapsScreen({
    Key key,
    @required GlobalKey<InnerDrawerState> drawerKey,
  })  : _drawerKey = drawerKey,
        super(key: key);

  final GlobalKey<InnerDrawerState> _drawerKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'آخر الخرائط',
            style: Theme.of(context).textTheme.headline6,
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.bars,
                    color: Constants.LIGHT_BG_COLOR,
                  ),
                  onPressed: () {
                    _drawerKey.currentState.toggle();
                  }),
            )
          ],
        ),
        body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: Hive.box('latest').listenable(),
              builder: (context, Box value, child) {
                return value.values.toList().isEmpty
                    ? ErrorScreen(
                        icon: Icons.watch_later,
                        error: 'لم يتم الدخول على أي خرائط مؤقتا',
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: value.values.toList().length,
                        itemBuilder: (context, index) {
                          String title = value.values
                              .toList()
                              .reversed
                              .toSet()
                              .toList()[index];
                          return MapsTile(title: title,showAppbar: true,);
                        },
                      );
              }),
        ));
  }
}
