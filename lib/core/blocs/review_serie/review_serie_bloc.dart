import 'package:bloc/bloc.dart';
import 'package:flutter_app_series_amaris/core/models/movie_tv_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_series_amaris/ui/views/review_serie_view/review_serie_view_store.dart';
import 'package:meta/meta.dart';

part 'review_serie_event.dart';
part 'review_serie_state.dart';

class ReviewSerieBloc extends Bloc<ReviewSerieEvent, ReviewSerieState> {
  ReviewSerieBloc() : super(ReviewSerieInitial()) {
    on<ReviewSerieEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetMovieTv>((event, emit) {
      emit(state.copyWith(movieTvModel: event.movieTvModel));
    });

    getDetailMovieTv();

  }

  final _store = StoreReviewSerieView();

  getDetailMovieTv() async {
    _store.loading = true;
    var url = Uri.https(state.baseUrl!, '3/tv/${_store.movieTv!.id}', {
      'api_key': state.apiKey,
      'language': state.language
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      _store.loading = false;
      final DetailMovieTvModel movies = DetailMovieTvModel.fromJson(response.body);
      add( GetMovieTv(movies) );
    }
  }
}
