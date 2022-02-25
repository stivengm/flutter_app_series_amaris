import 'package:flutter_app_series_amaris/core/models/movie_model.dart';

class StoreHomeView {
  
  bool? loading = false;

  List<SeriesModel>? favorites = [];

  static final StoreHomeView _singleton = StoreHomeView._();
  factory StoreHomeView() => _singleton;
  StoreHomeView._();
}