import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  final suggestions = [
    'إسمو إبشويس',
    'هوس إيروف',
    'التوزيع',
    'الهيتينيات',
    'الهوس الكبير',
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
  String get searchFieldLabel => '';

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: () => query = '')
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: Get.theme.iconTheme.color,
      ),
      onPressed: () => close(context, null));

  // TODO: implement buildResults
  @override
  Widget buildResults(BuildContext context) => Scaffold();

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
