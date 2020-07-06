part of 'maps_sort_bloc.dart';

@immutable
abstract class MapsSortState {}

class MapsSortInitial extends MapsSortState {}

class MapsSortDone extends MapsSortState {
  final List data;

  MapsSortDone(this.data);
}

class MapsSortFailure extends MapsSortState {
  final String error;

  MapsSortFailure(this.error);
}
