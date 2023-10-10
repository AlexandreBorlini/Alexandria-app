import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class txi_OneLineInput extends StatelessWidget {
  final String hintText;
  final myController;

  const txi_OneLineInput(this.hintText, this.myController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Container(
        height: 40.0,
        child: TextField(
          controller: myController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            contentPadding: EdgeInsets.all(10.0),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}

class txi_MultipleLineInput extends StatelessWidget {
  final String hintText;
  final myController;

  const txi_MultipleLineInput(this.hintText, this.myController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Container(
        height: 300.0,
        child: TextField(
          keyboardType: TextInputType.multiline,
          controller: myController,
          maxLines: null,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            contentPadding: EdgeInsets.all(10.0),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}