part of 'review_serie_bloc.dart';

@immutable
abstract class ReviewSerieEvent {}

class GetMovieTv extends ReviewSerieEvent {
  final DetailMovieTvModel? movieTvModel;
  GetMovieTv(this.movieTvModel);
}
