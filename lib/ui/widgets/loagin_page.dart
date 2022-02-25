import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppStyle.darkBackground),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}