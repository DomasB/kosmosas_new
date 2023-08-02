import 'package:flutter/material.dart';

class KMenuButton extends StatelessWidget {
  const KMenuButton({super.key, required this.onPressed, this.text = ''});

  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text.toUpperCase(),
          textScaleFactor: 2,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
    );
  }
}
