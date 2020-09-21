import 'package:flutter/material.dart';
import 'package:hoos/constants.dart';

class ReusableListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const ReusableListTile({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        color: Constants.PRIMARY_COLOR,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(8),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
          ),
          trailing: Icon(
            icon,
            color: Constants.LIGHT_BG_COLOR,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
