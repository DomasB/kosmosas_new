import 'package:flutter/material.dart';

enum KButtonVariation { top, bottom }

class KButtonOutlined extends StatelessWidget {
  const KButtonOutlined(
      {super.key, required this.onPressed,
      this.text = '',
      this.variation = KButtonVariation.top,
      this.icon});

  final GestureTapCallback onPressed;
  final String text;
  final KButtonVariation variation;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Stack(alignment: AlignmentDirectional.center, children: [
          Image(
              image: AssetImage(variation == KButtonVariation.top
                  ? "assets/images/button1.png"
                  : "assets/images/button2.png")),
          icon != null ? icon! : const SizedBox(),
          Text(text,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                  height: variation == KButtonVariation.top ? 2 : 1)),
        ]));
  }
}
