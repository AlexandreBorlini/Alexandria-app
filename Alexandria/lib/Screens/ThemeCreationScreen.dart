import 'package:alexandria/Classes/Information.dart';
import 'package:alexandria/TextInput.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ThemeCreationScreen extends StatelessWidget {
  ThemeCreationScreen({super.key});

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Column( children: [

        txi_OneLineInput('Digite o nome', nameController),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _sendDataBack(context);
            },
            child: const Text('Criar'),
          ),
        )],
      ),
    );
  }

  void _sendDataBack(BuildContext context) {

    Folder folder = Folder(name: nameController.text, folderIdList: [], informationIdList: []);
    _saveThemeDatabase(folder);

    Navigator.pop(context, folder);
  }

  Future _saveThemeDatabase(Folder folder) async {

    await FirebaseFirestore.instance.collection('folder').add({
      'name': folder.name,
      'folderIdList': <String>[],
      'informationIdList': <String>[],
    });
  }
}