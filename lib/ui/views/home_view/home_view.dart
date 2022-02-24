import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/core/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_app_series_amaris/core/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';
import 'package:flutter_app_series_amaris/ui/views/home_view/page_view.dart';
import 'package:flutter_app_series_amaris/ui/widgets/text_app_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  PageController pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: TextApp(
              text: '${state.nameScreen}',
              color: AppStyle.greyColor,
            ),
            backgroundColor: AppStyle.darkBackground,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: AppStyle.greyColor,
                ),
                onPressed: logOut,
              )
            ],
          ),
          body: state.loading! ? const CircularProgressIndicator() : PageViewWidget(pageController: pagecontroller),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppStyle.blackColor,
            type: BottomNavigationBarType.fixed,
            fixedColor: AppStyle.primaryColor,
            unselectedItemColor: AppStyle.whiteColor,
            onTap: (i) => getNameScreen(i),
            currentIndex: state.currentIndex!,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  MdiIcons.homeOutline
                ),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    MdiIcons.heartOutline
                  ),
                  label: 'Favorites'
                ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_backup_restore_outlined
                  ),
                  label: 'Recient'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search
                ), 
                label: 'Search'
              ),
            ],
          ),
        );
      },
    );
  }

  logOut() {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    loginBloc.logout();
    homeBloc.add( HandleCurrentIndex(currentIndex: 0, nameScreen: 'Home') );
    Navigator.of(context).pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
  }

  getNameScreen(i) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    String nameScreen = '';
    switch (i) {
      case 0:
          nameScreen = 'Home';
        break;
      case 1:
          nameScreen = 'Favorites';
        break;
      case 2:
          nameScreen = 'Recient';
        break;
      case 3:
          nameScreen = 'Search';
        break;
      default:
    }
    pagecontroller.animateToPage(i, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    homeBloc.add( HandleCurrentIndex(currentIndex: i, nameScreen: nameScreen) );
  }

}
