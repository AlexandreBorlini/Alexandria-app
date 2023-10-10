
import 'package:alexandria/Classes/Information.dart';
import 'package:alexandria/Classes/InformationCard.dart';
import 'package:alexandria/Classes/ThemeButton.dart';
import 'package:alexandria/Screens/FolderVisualizationScreen.dart';
import 'package:alexandria/TextInput.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<FolderVisualizationScreenState> _key = GlobalKey();

  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FolderVisualizationScreen("title", key: _key);
  }

  // void _refreshFolders(newFolder) {
  //   setState(() {
  //
  //     folderButtons.add(btn_Theme(newFolder, () => {
  //
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => FolderVisualizationScreen(newFolder.name),
  //     ))
  //
  //     }));
  //   });
  // }
}

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

