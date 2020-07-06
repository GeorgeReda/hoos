import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial());

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    yield MapInitial();
    //Todo: add db get data
    yield MapDone([
      'images/church.jpg',
      'images/church1.jpg',
      'images/church2.jpg',
    ]);
  }
}
