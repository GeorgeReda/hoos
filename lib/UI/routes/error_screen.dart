import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key key, this.error}) : super(key: key);
  final String error;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.exclamationCircle,
              size: 24,
              color: Constants.PRIMARY_COLOR,
            ),
            SizedBox(height: 20),
            Text(
              error,
              style: Theme.of(context).primaryTextTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }
}
