import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/core/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';
import 'package:flutter_app_series_amaris/ui/widgets/primary_button.dart';
import 'package:flutter_app_series_amaris/ui/widgets/text_app_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SerieView extends StatefulWidget {
  const SerieView({ Key? key }) : super(key: key);

  @override
  State<SerieView> createState() => _SerieViewState();
}

class _SerieViewState extends State<SerieView> {
  PageController pageController = PageController();
  String image = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppStyle.greyColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const TextApp(text: 'Popular', color: AppStyle.greyColor,),
        centerTitle: false,
        backgroundColor: AppStyle.transparent,
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body () {
    int index = 0;
    Size _media = MediaQuery.of(context).size;
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Container(
      decoration: BoxDecoration(
        color: AppStyle.darkBackground,
        // image: DecorationImage(
        //   image: NetworkImage('https://image.tmdb.org/t/p/w500/${image}'),
        //   fit: BoxFit.cover
        // ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: _media.height * .55,
            child: Swiper(
              itemCount: homeBloc.state.movies!.results!.length,
              viewportFraction: 0.75,
              onIndexChanged: changeIndex,
              scale: 0.7,
              itemWidth: _media.width * .5,
              itemHeight: _media.height * .5,
              itemBuilder: (context, index) {
                index = index;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: FadeInImage(
                    placeholder: NetworkImage('https://image.tmdb.org/t/p/w500/${homeBloc.state.movies!.results![index].posterPath}'),
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/${homeBloc.state.movies!.results![index].posterPath}'),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            // color: Colors.red,
            height: _media.height * .3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          TextApp(text: '${homeBloc.state.movies!.results![index].title}', fontSize: 30.0, color: AppStyle.whiteColor),
                          const SizedBox(height: 15.0),
                          const TextApp(text: 'Starsssss!!!',),
                          const SizedBox(height: 10.0),
                          TextApp(text: '${homeBloc.state.movies!.results![index].voteAverage}', color: AppStyle.whiteColor),
                          const SizedBox(height: 15.0),
                          SizedBox(
                            width: _media.width * .4,
                            child: PrimaryButton(text: 'Watch Now', color: AppStyle.darkBackground,),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  int changeIndex(int i) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    setState(() {
      image = homeBloc.state.movies!.results![i].posterPath;
    });
    pageController.animateToPage(i, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
    return i;
  }

}