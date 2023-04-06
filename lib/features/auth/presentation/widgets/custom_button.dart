import 'package:flutter/material.dart';
import 'package:moexfilm/config/app_color.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, required this.text, this.image, required this.onPressed});

  final VoidCallback? onPressed;
  final Text text;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {
        onPressed?.call();
      },
      child: Ink(
        width: 220,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              image != null ? image! : Container(),
              SizedBox(width: 12),
              text
            ],
          ),
        ),
      ),
    );
  }
}
