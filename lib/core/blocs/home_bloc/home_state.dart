part of 'home_bloc.dart';

class HomeState {
  final bool? loading;
  final int? currentIndex;
  final String? nameScreen;
  final String? apiKey;
  final String? language;
  final String? baseUrl;

  final PopularesModel? populares;
  final List<SeriesModel>? favorite;
  final PopularesModel? recommendations;

  HomeState({
    this.loading = false,
    this.currentIndex = 0,
    this.nameScreen = 'Home',
    this.populares,
    this.apiKey = '48f78c52c635970fef68388e26cf342b',
    this.language = 'es-ES',
    this.baseUrl = 'api.themoviedb.org',
    this.recommendations,
    this.favorite
  });

  HomeState copyWith({
    bool? loading,
    int? currentIndex,
    String? nameScreen,
    PopularesModel? populares,
    String? apiKey,
    String? language,
    String? baseUrl,
    PopularesModel? recommendations,
    List<SeriesModel>? favorite,
  }) => HomeState(
    loading: loading ?? this.loading,
    currentIndex: currentIndex ?? this.currentIndex,
    nameScreen: nameScreen ?? this.nameScreen,
    populares: populares ?? this.populares,
    apiKey: apiKey ?? this.apiKey,
    language: language ?? this.language,
    baseUrl: baseUrl ?? this.baseUrl,
    recommendations: recommendations ?? this.recommendations,
    favorite: favorite ?? this.favorite
  );

}

class HomeInitial extends HomeState {}
