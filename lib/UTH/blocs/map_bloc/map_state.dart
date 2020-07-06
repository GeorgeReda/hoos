part of 'map_bloc.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class MapDone extends MapState {
  final List data;

  MapDone(this.data);
}

class MapFailure extends MapState {
  final String error;

  MapFailure(this.error);
}
