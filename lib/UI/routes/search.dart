import 'package:flutter/material.dart';
import 'package:hoos/UI/widgets/custom_search_delegate.dart';

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
    );
  }
}
