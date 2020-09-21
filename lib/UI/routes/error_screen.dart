import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key key,
    this.error,
    this.icon = Icons.error,
  }) : super(key: key);
  final String error;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: MediaQuery.of(context).size.width / 3,
                color: Colors.grey,
              ),
              SizedBox(height: 20),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$error',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Get.isDarkMode
                        ? Theme.of(context).textTheme.bodyText2.color
                        : Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
