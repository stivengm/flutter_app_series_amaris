part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ChangeLoading extends HomeEvent {
  final bool loading;
  ChangeLoading(this.loading);
}

class HandleCurrentIndex extends HomeEvent {
  final int currentIndex;
  final String nameScreen;
  HandleCurrentIndex({
    required this.currentIndex,
    required this.nameScreen
  });
}

class GetMovies extends HomeEvent {
  final PopularesModel? movies;
  GetMovies(this.movies);
}

class GetRecommendations extends HomeEvent {
  final PopularesModel? recommendations;
  GetRecommendations(this.recommendations);
}