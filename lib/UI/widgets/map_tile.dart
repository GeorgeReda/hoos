import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hoos/UI/routes/map_gallery.dart';

import '../../constants.dart';

class MapsTile extends StatefulWidget {
  const MapsTile({
    Key key,
    @required this.title,
    @required this.showAppbar,
  }) : super(key: key);
  final String title;
  final bool showAppbar;
  @override
  _MapsTileState createState() => _MapsTileState();
}

class _MapsTileState extends State<MapsTile> {
  Box box;
  List list;
  @override
  void initState() {
    box = Hive.box('latest');
    list = box.values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(color: Constants.ACCENT_COLOR, fontSize: 18),
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
      ),
      onTap: () {
        if (list.contains(widget.title) == false) {
          if (list.length >= 5) {
            box
              ..deleteAll([4, 5, 6, 7, 8, 9, 10])
              ..compact();
          }
          box.add(widget.title);
        }
        return Get.to(MapGallery(
            showAppbar:widget.showAppbar,
            title: widget.title));
      },
    );
  }
}
