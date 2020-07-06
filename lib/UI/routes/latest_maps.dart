import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hoos/UI/widgets/map_tile.dart';
import 'package:hoos/UTH/blocs/sort_bloc/maps_sort_bloc.dart';

import '../../constants.dart';
import 'error_screen.dart';

class LatestMapsScreen extends StatelessWidget {
  LatestMapsScreen({
    Key key,
    @required GlobalKey<InnerDrawerState> drawerKey,
  })  : _drawerKey = drawerKey,
        super(key: key);

  final GlobalKey<InnerDrawerState> _drawerKey;
  final MapsSortBloc _bloc = MapsSortBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.add(LatestMaps());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'آخر الخرائط',
            style: Theme.of(context).textTheme.headline6,
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.bars,
                    color: Constants.LIGHT_BG_COLOR,
                  ),
                  onPressed: () {
                    _drawerKey.currentState.toggle();
                  }),
            )
          ],
        ),
        body: SafeArea(
          child: BlocBuilder(
            bloc: _bloc,
            builder: (context, state) {
              if (state is MapsSortInitial)
                return Constants.circularProgressIndicator;
              else if (state is MapsSortFailure)
                return ErrorScreen(error: state.error);
              else if (state is MapsSortDone)
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) =>
                        MapsTile(title: state.data[index]));
              return Container();
            },
          ),
        ));
  }
}
