import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/core/blocs/review_serie/review_serie_bloc.dart';
import 'package:flutter_app_series_amaris/core/models/movie_model.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';
import 'package:flutter_app_series_amaris/ui/views/review_serie_view/review_serie_view_store.dart';
import 'package:flutter_app_series_amaris/ui/widgets/loagin_page.dart';
import 'package:flutter_app_series_amaris/ui/widgets/text_app_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReviewSerieView extends StatelessWidget {
  final SeriesModel? serie;
  const ReviewSerieView({Key? key, this.serie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = StoreReviewSerieView();
    return BlocBuilder<ReviewSerieBloc, ReviewSerieState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500/${_store.movieTv!.posterPath}'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.0)),
                  ),
                ),
              ),
              Container(
                height: 70.0,
                child: AppBar(
                  elevation: 0,
                  title: TextApp(text: _store.movieTv!.name),
                  backgroundColor: AppStyle.transparent,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(MdiIcons.heartOutline))
                  ],
                ),
              ),
              state.movieTvModel != null ? Container(
                padding: const EdgeInsets.only(top: 75.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://image.tmdb.org/t/p/w500/${state.movieTvModel!.lastEpisodeToAir!.stillPath}')
                        ),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                    ),
                    TextApp(text: state.movieTvModel!.name!, color: AppStyle.whiteColor, fontSize: 30.0,),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        TextApp(text: 'IMDb: ${state.movieTvModel!.seasons!.length.toString()} Seasons', color: AppStyle.greyColor),
                        const SizedBox(width: 10.0),
                        const TextApp(text: '|', color: AppStyle.greyColor,),
                        const SizedBox(width: 10.0),
                        TextApp(text: '${state.movieTvModel!.voteAverage} Seasons', color: AppStyle.greyColor)
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const Divider(),
                    const SizedBox(height: 10.0),
                    TextApp(text: state.movieTvModel!.lastEpisodeToAir!.overview, color: AppStyle.whiteColor,)
                  ],
                )
              ) : const LoadingPage()
            ],
          ),
        );
      },
    );
  }
}
