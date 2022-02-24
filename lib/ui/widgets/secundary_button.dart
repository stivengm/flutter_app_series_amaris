import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';

class SecundaryButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onPressed;
  const SecundaryButton({ Key? key, this.text, this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        child: Text(text!),
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(AppStyle.padding12)),
          foregroundColor: MaterialStateProperty.all<Color>(AppStyle.blackColor),
          backgroundColor: MaterialStateProperty.all<Color>(AppStyle.whiteColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(
                color: AppStyle.whiteColor
              )
            )
          )
        )

      ),
    );
  }
}