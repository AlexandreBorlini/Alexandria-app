import 'package:alexandria/Classes/Information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class btn_Theme extends StatelessWidget {
  final Folder folder;
  final Function() fun;

  const btn_Theme(this.folder, this.fun, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: fun,
          child: Align(
            alignment: Alignment.center,
            child: Text(folder.name),
          ),
        ),
      ),
    );
  }
}