import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/core/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_app_series_amaris/core/models/movie_model.dart';
import 'package:flutter_app_series_amaris/core/models/movies_populares_model.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';
import 'package:flutter_app_series_amaris/ui/views/favorites_view/favorites_view.dart';
import 'package:flutter_app_series_amaris/ui/views/home_view/home_view_store.dart';
import 'package:flutter_app_series_amaris/ui/views/recient_view/recient_view.dart';
import 'package:flutter_app_series_amaris/ui/widgets/loagin_page.dart';
import 'package:flutter_app_series_amaris/ui/widgets/primary_button.dart';
import 'package:flutter_app_series_amaris/ui/widgets/text_app_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PageViewWidget extends StatefulWidget {
  final PageController pageController;
  const PageViewWidget({Key? key, required this.pageController}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final _store = StoreHomeView();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: widget.pageController,
          scrollDirection: Axis.horizontal,
          children: [
            _body(),
            const FavoriteView(),
            const RecientView(),
            Container(
              color: AppStyle.darkBackground,
            ),
          ],
        );
      },
    );
  }

  Widget _body() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return homeBloc.state.populares != null ? Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppStyle.darkBackground),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          _popular(),
          const Divider(color: AppStyle.greyColor),
          _header('Recommendations'),
          homeBloc.state.recommendations != null ? ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: homeBloc.state.recommendations!.results!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _itemRecommendations(homeBloc.state.recommendations!, index)
                ],
              );
            }
          ) : const LoadingPage(),
        ],
      ),
    ) : const LoadingPage();
  }

  Widget _header(text) {
    return TextApp(
      text: text,
      color: AppStyle.whiteColor,
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.left
    );
  }

  Widget recommendations() {
    Size _media = MediaQuery.of(context).size;
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return homeBloc.state.recommendations != null ? Column(
      children: [
        SizedBox(
          // width: double.infinity,
          height: _media.height * 0.6,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: homeBloc.state.recommendations!.results!.length,
            itemBuilder: (context, index) {
              return _itemRecommendations(homeBloc.state.recommendations!, index);
            }
          ),
        ),
      ],
    ) : const SizedBox();
  }

  _itemRecommendations(PopularesModel movie, int index) {
    Size _media = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          Container(
            width: 130.0,
            height: 150.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.results![index].posterPath}'),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(8.0)
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextApp(text: '${movie.results![index].name}', color: AppStyle.whiteColor),
                  RatingStars(
                    value: movie.results![index].voteAverage!,
                    starBuilder: (index, color) => Icon(
                      MdiIcons.star,
                      color: color,
                      size: 15.0,
                    ),
                    starCount: 5,
                    starSize: 15,
                    maxValue: 10,
                    starSpacing: 0,
                    maxValueVisibility: true,
                    valueLabelVisibility: false,
                    animationDuration: const Duration(milliseconds: 1000),
                    valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    valueLabelMargin: const EdgeInsets.only(right: 8),
                    starOffColor: const Color(0xffe7e8ea),
                    starColor: AppStyle.greyColor,
                  ),
                  TextApp(text: 'IMDb: ${movie.results![index].voteAverage}', color: AppStyle.greyColor,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: _media.width * .35,
                        child: PrimaryButton(text: 'Watch Now', color: AppStyle.darkBackground, onPressed: () {},),
                      ),
                      IconButton(
                        icon: const Icon(
                          MdiIcons.heartOutline
                        ),
                        color: AppStyle.greyColor,
                        onPressed: () => addFavorites(movie.results![index]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  addFavorites(SeriesModel? movieTv) {
    _store.favorites!.add(movieTv!);
    setState(() { });
  }

  Widget _popular() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    // homeBloc.getMovies();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header('Popular'),
        const SizedBox(height: 15.0),
        homeBloc.state.populares != null ?
        Container(
          // width: double.infinity,
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeBloc.state.populares!.results!.length,
            itemBuilder: (context, index) {
              return _itemPopular(homeBloc.state.populares!, index);
            },
          ),
        ) : const SizedBox(),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(),
            TextApp(
                text: 'See All', color: AppStyle.primaryColor, fontSize: 17.0)
          ],
        ),
        const SizedBox(height: 10.0)
      ],
    );
  }

  Widget _itemPopular(PopularesModel movie, int index) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'serie_view_info'),
      child: Container(
        width: 120.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 178.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.results![index].posterPath}'),
                  fit: BoxFit.contain
                ),
                borderRadius: BorderRadius.circular(8.0)
              ),
            ),
            const SizedBox(height: 5.0),
            TextApp(
              text: movie.results![index].name!,
              fontSize: 17.0,
              color: AppStyle.greyColor,
            ),
            const SizedBox(height: 5.0),
            RatingStars(
              value: movie.results![index].voteAverage!,
              starBuilder: (index, color) => Icon(
                MdiIcons.star,
                color: color,
                size: 15.0,
              ),
              starCount: 5,
              starSize: 15,
              maxValue: 10,
              starSpacing: 0,
              maxValueVisibility: true,
              valueLabelVisibility: false,
              animationDuration: const Duration(milliseconds: 1000),
              valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
              valueLabelMargin: const EdgeInsets.only(right: 8),
              starOffColor: const Color(0xffe7e8ea),
              starColor: AppStyle.greyColor,
            ),
          ],
        ),
      ),
    );
  }


}
