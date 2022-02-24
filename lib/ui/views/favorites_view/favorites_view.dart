import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';
import 'package:flutter_app_series_amaris/ui/widgets/primary_button.dart';
import 'package:flutter_app_series_amaris/ui/widgets/text_app_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({ Key? key }) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppStyle.darkBackground,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              _item(),
              const Divider(color: AppStyle.greyColor,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _item() {
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
                    image: const DecorationImage(
                      image: AssetImage("assets/theWitcher.jpg"),
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
                const TextApp(text: 'The Witcher', color: AppStyle.whiteColor, fontSize: 20.0,),
                const SizedBox(height: 5.0),
                const TextApp(text: 'Stars', color: AppStyle.whiteColor, fontSize: 13.0,),
                const SizedBox(height: 5.0),
                const TextApp(text: 'IMDb: 8,4', color: AppStyle.whiteColor, fontSize: 13.0,),
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
                      onPressed: () {},
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