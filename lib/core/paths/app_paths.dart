import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/ui/views/home_view/home_view.dart';
import 'package:flutter_app_series_amaris/ui/views/login_view/login_view.dart';
import 'package:flutter_app_series_amaris/ui/views/review_serie_view/review_serie_view.dart';
import 'package:flutter_app_series_amaris/ui/views/serie_view/serie_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {

  'home':             ( _ ) => const HomeView(),
  'login':            ( _ ) => const LoginView(),
  'review_serie':     ( _ ) => const ReviewSerieView(),
  'serie_view_info':  ( _ ) => const SerieView(),

};