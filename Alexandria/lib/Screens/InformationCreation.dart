import 'package:alexandria/Classes/Information.dart';
import 'package:alexandria/TextInput.dart';
import 'package:alexandria/Widgets/Snackbars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InformationCreationScreen extends StatelessWidget {
  InformationCreationScreen({super.key});

  final titleController = TextEditingController();
  final informationController = TextEditingController();
  final referenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
    child: Column( children: [

        txi_OneLineInput('Digite o título', titleController),
        txi_MultipleLineInput('Digite a informação', informationController),
        txi_OneLineInput('Digite a Referência', referenceController),
        Center(
        child: ElevatedButton(
          onPressed: () {
            _sendDataBack(context);
          },
          child: const Text('Criar'),
        ),
      )],
    ),
      ),
    );
  }

  void _sendDataBack(BuildContext context) {

    Information information = Information(
    title: titleController.text,
    information: informationController.text,
    reference: referenceController.text
    );
    _saveInformationDatabase(information);

    if(titleController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(snb_Error("Título é obrigatório"));
    } else {
      Navigator.pop(context, information);
    }
  }

  Future _saveInformationDatabase(Information information) async {

    await FirebaseFirestore.instance.collection('information').add({
      'title': information.title,
      'information': information.information,
      'reference': information.reference
    });
  }
}