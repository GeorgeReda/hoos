import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hoos/UI/routes/error_screen.dart';
import 'package:hoos/UI/routes/map_gallery.dart';

class CustomSearchDelegate extends SearchDelegate {
  final suggestions = [
    'إسمو إبشويس',
    'هوس إيروف',
    'التوزيع',
    'الهيتينيات',
    'الهوس الكبير',
    'تينين',
    'تين أويه إنثوك',
    'لبش الهوس الأول'
  ];
  final recent = ['تينين', 'تين أويه إنثوك', 'لبش الهوس الأول'];
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () => query = '',
        tooltip: 'حذف البحث',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () => close(context, null));
  @override
  Widget buildResults(BuildContext context) {
    if (suggestions.contains(query))
      return MapGallery(
          showAppbar: false,
        title: query,
      );
    return ErrorScreen(
        error:
            "الرجاء الإختيار من قائمة الإقتراحات و الإلتزام بطريقة البحث الموجودة في صفحة البحث");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = query.isEmpty
        ? recent
        : suggestions
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          FontAwesomeIcons.search,
          color: Get.theme.primaryColor.withOpacity(0.5),
        ),
        title: RichText(
            text: TextSpan(
                children: [
              TextSpan(
                  text: list[index].substring(query.length),
                  style: Theme.of(context).primaryTextTheme.bodyText2)
            ],
                text: list[index].substring(0, query.length),
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.bold))),
        onTap: () {
          query = '${list[index]}';
          showResults(context);
        },
      ),
    );
  }
}
