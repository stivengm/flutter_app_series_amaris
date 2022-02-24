import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/core/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';
import 'package:flutter_app_series_amaris/ui/widgets/primary_button.dart';
import 'package:flutter_app_series_amaris/ui/widgets/secundary_button.dart';
import 'package:flutter_app_series_amaris/ui/widgets/snackBar.dart';
import 'package:flutter_app_series_amaris/ui/widgets/text_app_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  double height = 0.0;

  @override
  Widget build(BuildContext context) {
    Size _media = MediaQuery.of(context).size;
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/theWitcher.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center)
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const TextApp(
                    text: 'Welcome!',
                    fontSize: 23.0,
                    color: AppStyle.whiteColor,
                  ),
                  Stack(
                    children: [
                      AnimatedContainer(
                        height: height,
                        width: double.infinity,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0
                        ),
                        decoration: BoxDecoration(
                          color: AppStyle.darkBackground.withOpacity(.9),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0)
                          )
                        ),
                        child: AnimatedOpacity(
                          opacity: !state.openLogin! ? 0.0 : 1.0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: AppStyle.whiteColor,
                                    ),
                                    onPressed: () {
                                      // final loginBloc = BlocProvider.of<LoginBloc>(context);
                                      loginBloc.add( OpenLogin(false) );
                                      validAnimation();
                                    },
                                  )
                                ],
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Name',
                                        hintStyle: TextStyle(
                                          color: AppStyle.whiteColor
                                        )
                                      ),
                                      onChanged: (value) {
                                        loginBloc.add( ChangeNameLogin(value) );
                                      },
                                      style: const TextStyle(
                                        color: AppStyle.whiteColor
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                          color: AppStyle.whiteColor
                                        )
                                      ),
                                      onChanged: (value) {
                                        loginBloc.add( ChangePasswordLogin(value) );
                                      },
                                      style: const TextStyle(
                                        color: AppStyle.whiteColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: _media.width * .4,
                                child: SecundaryButton(text: 'Log in', onPressed: () {
                                  // final loginBloc = BlocProvider.of<LoginBloc>(context);
                                  final bool validLogin = loginBloc.login();
                                  if (validLogin) {
                                    Navigator.pushReplacementNamed(context, 'home');
                                  } else {
                                    SnackBarMensaje(
                                      context
                                    ).lanzar();
                                  }
                                }),
                              ),
                            ],
                          ),
                        )
                      ),
                      AnimatedOpacity(
                        opacity: state.openLogin! ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: _media.width * 1.0,
                          height: _media.height * .5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: _media.width * .4,
                                    child: PrimaryButton(text: 'Sign up', color: AppStyle.darkBackground, onPressed: () { },),
                                  ),
                                  const SizedBox(height: 10.0),
                                  SizedBox(
                                    width: _media.width * .4,
                                    child: SecundaryButton(text: 'Log in', onPressed: () {
                                      // final loginBloc = BlocProvider.of<LoginBloc>(context);
                                      loginBloc.add( OpenLogin(true) );
                                      validAnimation();
                                    }),
                                  ),
                                  const SizedBox(height: 20.0),
                                  const Text("Forgot password?", style: TextStyle( color: AppStyle.whiteColor, decoration: TextDecoration.underline )),
                                ],
                              ),
                              const SizedBox() 
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   width: _media.width * .4,
                  //   height: _media.height * .5,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         children: [
                  //           PrimaryButton(text: 'Sign up', onPressed: () { },),
                  //           const SizedBox(height: 10.0),
                  //           SecundaryButton(text: 'Log in', onPressed: () {
                  //             final loginBloc = BlocProvider.of<LoginBloc>(context);
                  //             loginBloc.add( OpenLogin(true) );
                  //           }),
                  //           const SizedBox(height: 20.0),
                  //           const Text("Forgot password?", style: TextStyle( color: AppStyle.whiteColor, decoration: TextDecoration.underline )),
                  //         ],
                  //       ),
                  //       const SizedBox() 
                  //     ],
                  //   ),
                  // ),
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("C"),
        onPressed: () => validAnimation(),
      ),
    );
  }

  validAnimation() {
    setState(() {
      Size _media = MediaQuery.of(context).size;
      if (height == 0.0) {
        height = _media.height * .5;
      } else {
        height = 0.0;
      }
    });
  }

}
