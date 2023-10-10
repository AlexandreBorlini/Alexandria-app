import 'package:alexandria/InformationCreation.dart';
import 'package:alexandria/Screens/ThemeCreationScreen.dart';
import 'package:alexandria/main.dart';
import 'package:flutter/material.dart';

class mdl_creationOptions extends StatefulWidget {
  const mdl_creationOptions(this.fun, this.fun02, {super.key});

  final Function fun;
  final Function fun02;

  @override
  State<mdl_creationOptions> createState() => _mdl_creationOptions();
}

class _mdl_creationOptions extends State<mdl_creationOptions> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          // Creation modal buttons
          // 1st option: Annotation creation
          // 2nd option: Theme creation
            children: [
              btn_maxWidth(
                  "OPCAO 01", () => {_refreshPageInformation(context, widget.fun)}),
              btn_maxWidth(
                  "OPCAO 02", () => {_refreshPageFolder(context, widget.fun02)})
            ]));
  }

  void _refreshPageFolder(BuildContext context, Function fun) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThemeCreationScreen(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {

      fun(result);
      Navigator.pop(context);
    });
  }

  void _refreshPageInformation(BuildContext context, Function fun) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InformationCreationScreen(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {

      fun(result);
      Navigator.pop(context);
    });
  }
}
