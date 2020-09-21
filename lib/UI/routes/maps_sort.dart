import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoos/UI/widgets/map_tile.dart';
import 'package:hoos/UTH/blocs/sort_bloc/maps_sort_bloc.dart';

import '../../constants.dart';
import 'error_screen.dart';

class MapsSortScreen extends StatelessWidget {
  MapsSortScreen({Key key, @required this.title}) : super(key: key);
  final String title;
  final MapsSortBloc _bloc = MapsSortBloc();
  @override
  Widget build(BuildContext context) {
    _bloc.add(SortMaps(title));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder(
          cubit: _bloc,
          builder: (context, state) {
            if (state is MapsSortInitial)
              return Constants.circularProgressIndicator;
            else if (state is MapsSortFailure)
              return ErrorScreen(error: state.error);
            else if (state is MapsSortDone)
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: state.data.length,
                itemBuilder: (context, index) => MapsTile(
                    showAppbar: true,
                  title: state.data[index],
                ),
              );
            return Container();
          },
        ),
      ),
    );
  }
}
