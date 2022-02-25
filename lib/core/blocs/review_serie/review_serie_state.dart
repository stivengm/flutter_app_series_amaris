part of 'review_serie_bloc.dart';

class ReviewSerieState {
  final DetailMovieTvModel? movieTvModel;
  final String? apiKey;
  final String? language;
  final String? baseUrl;

  ReviewSerieState({
    this.movieTvModel,
    this.apiKey = '48f78c52c635970fef68388e26cf342b',
    this.language = 'es-ES',
    this.baseUrl = 'api.themoviedb.org',
  });

  ReviewSerieState copyWith({
    DetailMovieTvModel? movieTvModel,
    String? apiKey,
    String? language,
    String? baseUrl,
  }) => ReviewSerieState(
    movieTvModel: movieTvModel ?? this.movieTvModel,
    apiKey: apiKey ?? this.apiKey,
    language: language ?? this.language,
    baseUrl: baseUrl ?? this.baseUrl,
  );

}

class ReviewSerieInitial extends ReviewSerieState {}
