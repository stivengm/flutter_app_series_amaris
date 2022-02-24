import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/ui/app_style.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onPressed;
  final Color? color;
  const PrimaryButton({ Key? key, this.text, this.onPressed, this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        child: Text(text!, style: TextStyle(
          color: (color != null) ? color : Colors.white
        ),),
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(AppStyle.padding12)),
          foregroundColor: MaterialStateProperty.all<Color>(AppStyle.whiteColor),
          backgroundColor: MaterialStateProperty.all<Color>(AppStyle.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(
                color: AppStyle.primaryColor
              )
            )
          )
        )

      ),
    );
  }
}