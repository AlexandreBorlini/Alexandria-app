import 'package:flutter/material.dart';

class btn_maxWidth extends StatelessWidget {
  final String buttonText;
  final Function() onClick;

  const  btn_maxWidth(this.buttonText, this.onClick, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: onClick,
          child: Text(buttonText),
        ),
      ),
    );
  }
}