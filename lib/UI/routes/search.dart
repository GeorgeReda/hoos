import 'package:flutter/material.dart';
import 'package:hoos/UI/widgets/custom_search_delegate.dart';
import 'package:hoos/constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'البحث',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(
                  context: context, delegate: CustomSearchDelegate()))
        ],
      ),
      body: SafeArea(
          child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('طريقة البحث :',
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 28,
                  color: Constants.ACCENT_COLOR,
                )),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text(
                  'البحث عن طريق كتابة إسم الفصل و إختياره من قائمة المقترحات',
                  style: TextStyle(color: Constants.ACCENT_COLOR),
                ),
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text(
                  'إذا لم يتم الإختيار من القائمة ستظهر رسالة خطأ لعدم وجود المطلوب',
                  style: TextStyle(color: Constants.ACCENT_COLOR),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
