import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/core/models/movie_model.dart';
import 'package:flutter_app_series_amaris/core/models/movies_populares_model.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {

    getMovies();
    getRecomendations();

    on<ChangeLoading>((event, emit) {
      emit(state.copyWith( loading: event.loading ));
    });

    on<GetMovies>((event, emit) {
      emit(state.copyWith(populares: event.populares));
    });

    on<GetRecommendations>((event, emit) {
      emit(state.copyWith(recommendations: event.recommendations));
    });

    on<HandleCurrentIndex>((event, emit) {
      PageController pageController = PageController();
      emit(state.copyWith( currentIndex: event.currentIndex, nameScreen: event.nameScreen ));
    });

  }

  getMovies() async {
    // add( ChangeLoading(true) );
    var url = Uri.https(state.baseUrl!, '3/tv/popular', {
      'api_key': state.apiKey,
      'language': state.language,
      'page': '1'
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // add( ChangeLoading(false) );
      final PopularesModel movies = PopularesModel.fromJson(response.body);
      add( GetMovies(movies) );
    }
  }

  getRecomendations() async {
    // add( ChangeLoading(true) );
    var url = Uri.https(state.baseUrl!, '/3/tv/top_rated', {
      'api_key': state.apiKey,
      'language': state.language,
      'page': '1'
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // add( ChangeLoading(false) );
      final PopularesModel recommendations = PopularesModel.fromJson(response.body);
      add( GetRecommendations(recommendations));
    }
  }

}
