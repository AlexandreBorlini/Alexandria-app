import 'package:flutter/material.dart';

SnackBar snb_Error(String message) {

  return SnackBar(
  backgroundColor: Colors.red,
  content: Text(message),
  );
}
class snb_Success extends StatelessWidget {
  final String message;

  const snb_Success(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message),
    );
  }
}