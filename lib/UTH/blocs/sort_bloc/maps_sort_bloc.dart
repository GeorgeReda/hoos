import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'maps_sort_event.dart';
part 'maps_sort_state.dart';

class MapsSortBloc extends Bloc<MapsSortEvent, MapsSortState> {
  MapsSortBloc() : super(MapsSortInitial());

  @override
  Stream<MapsSortState> mapEventToState(
    MapsSortEvent event,
  ) async* {
    if (event is LatestMaps) {
      yield MapsSortInitial();

      yield MapsSortDone([
        'غولغوثا',
        'بيك إثرونوس',
        'كي إيبرتو',
      ]);
    }
    if (event is SortMaps) {
      yield MapsSortInitial();
      yield MapsSortDone([
        'غولغوثا',
        'بيك إثرونوس',
        'كي إيبرتو',
      ]);
    }
  }
}
