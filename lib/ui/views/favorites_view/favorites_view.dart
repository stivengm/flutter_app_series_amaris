import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/core/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_app_series_amaris/core/models/movie_model.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';
import 'package:flutter_app_series_amaris/ui/views/home_view/home_view_store.dart';
import 'package:flutter_app_series_amaris/ui/widgets/primary_button.dart';
import 'package:flutter_app_series_amaris/ui/widgets/text_app_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({ Key? key }) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final _store = StoreHomeView();
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Container(
      decoration: const BoxDecoration(
        color: AppStyle.darkBackground,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: _store.favorites!.isNotEmpty ? ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _store.favorites!.length,
        itemBuilder: (context, index) {
          return _item(_store.favorites![index], index);
        },
      ) : const TextApp(text: 'Not found favorites.', color: AppStyle.whiteColor,),
    );
  }

  Widget _item(SeriesModel? movieTv, int index) {
    Size _media = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 160.0,
          height: 200.0,
          child: Stack(
            children: [
              Positioned(
                left: 10.0,
                top: 10.0,
                child: Container(
                  width: 130.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://image.tmdb.org/t/p/w500/${movieTv!.posterPath}'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(text: '${movieTv.name}', color: AppStyle.whiteColor, fontSize: 20.0,),
                const SizedBox(height: 5.0),
                const TextApp(text: 'Stars', color: AppStyle.whiteColor, fontSize: 13.0,),
                const SizedBox(height: 5.0),
                TextApp(text: 'IMDb: ${movieTv.voteAverage}', color: AppStyle.whiteColor, fontSize: 13.0,),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: _media.width * .3,
                      child: PrimaryButton(text: 'Watch Now', onPressed: () { },),
                    ),
                    IconButton(
                      icon: Icon(
                        MdiIcons.heart,
                        color: AppStyle.primaryColor.withOpacity(.4),
                      ),
                      onPressed: () {
                        _store.favorites!.removeAt(index);
                        setState(() { });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}