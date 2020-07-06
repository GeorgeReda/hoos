part of 'maps_sort_bloc.dart';

@immutable
abstract class MapsSortEvent {}

class LatestMaps extends MapsSortEvent {}

class SortMaps extends MapsSortEvent {
  final String title;

  SortMaps(this.title);
}
