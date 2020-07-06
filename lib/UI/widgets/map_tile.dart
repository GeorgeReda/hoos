import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoos/UI/routes/map_gallery.dart';

import '../../constants.dart';

class MapsTile extends StatelessWidget {
  const MapsTile({
    Key key,
    @required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Constants.ACCENT_COLOR,fontSize: 16),
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
      ),
      onTap: () => Get.to(MapGallery(title: title)),
    );
  }
}
