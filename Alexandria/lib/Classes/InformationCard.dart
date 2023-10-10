import 'package:alexandria/Classes/Information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TITLE_FONT_SIZE = 18.0;
const INFORMATION_FONT_SIZE = 16.0;
const REFERENCE_FONT_SIZE = 14.0;

const SPACE_BETWEEN_TITLE_INFORMATION = 10.0;
const SPACE_BETWEEN_INFORMATION_REFERENCE = 10.0;

class crd_Information extends StatelessWidget {
  final Information info;

  const crd_Information(this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(Colors.black54.value),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(info.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: TITLE_FONT_SIZE)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(.0, SPACE_BETWEEN_TITLE_INFORMATION, .0, .0),
                alignment: Alignment.centerLeft,
                child: Text(info.information,
                    style: const TextStyle(fontSize: INFORMATION_FONT_SIZE)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(.0, SPACE_BETWEEN_INFORMATION_REFERENCE, .0, .0),
                alignment: Alignment.centerLeft,
                child: Text(info.reference,
                    style: const TextStyle(fontSize: REFERENCE_FONT_SIZE)),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
