import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonToPage extends StatelessWidget {
  const ButtonToPage({super.key, required this.onPressed, required this.text});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(5),
            backgroundColor: const Color(0xff3fbbc0),
            minimumSize: const Size(100, 40)),
        onPressed: onPressed,
        child: Text(text));
  }
}
