import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;

  const MyButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
