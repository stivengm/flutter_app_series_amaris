import 'package:flutter_app_series_amaris/core/models/movie_model.dart';

class StoreReviewSerieView {
  
  bool? loading = false;

  SeriesModel? movieTv = SeriesModel();

  static final StoreReviewSerieView _singleton = StoreReviewSerieView._();
  factory StoreReviewSerieView() => _singleton;
  StoreReviewSerieView._();
}