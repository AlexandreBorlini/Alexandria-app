
import 'package:alexandria/Classes/Information.dart';
import 'package:alexandria/Classes/InformationCard.dart';
import 'package:alexandria/Classes/ThemeButton.dart';
import 'package:alexandria/Screens/InformationCreation.dart';
import 'package:alexandria/Screens/ThemeCreationScreen.dart';
import 'package:alexandria/TextInput.dart';
import 'package:alexandria/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FolderVisualizationScreen extends StatefulWidget {
  FolderVisualizationScreen(this.title, {super.key});

  final String title;
  final List<Widget> folderButtons = [];
  final List<Widget> infoCards = [];

  @override
  State<FolderVisualizationScreen> createState() => FolderVisualizationScreenState();
}

class FolderVisualizationScreenState extends State<FolderVisualizationScreen> {

  final searchController = TextEditingController();

  @override
  void initState()
  {
    super.initState();
    _getAllInformations();
    _getAllFolders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            txi_OneLineInput('teste', searchController),
            const Padding( padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0)),
        Expanded( child: Container(
                height: 500,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        informationCardList(),
                        folderButtonList(),
                      ])
                  )
              ),
        ),
          const Padding( padding: EdgeInsets.fromLTRB(0, 15, 0, 10)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) =>
                  mdl_creationOptions(_refreshInformations, _refreshFolders));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget informationCardList() {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: widget.infoCards,
        ));
  }

  Widget folderButtonList() {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: widget.folderButtons,
        ));
  }

  Future _getAllInformations() async {

    if(widget.infoCards.isEmpty == true) {
      Stream<List<Information>> infoStream = await FirebaseFirestore.instance
          .collection('information')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Information.fromJson(doc.data()))
              .toList());

      infoStream.listen((infoList) {
        refreshInformations(infoList);
      });
    }
  }

  Future _getAllFolders() async {

    if(widget.folderButtons.isEmpty == true) {
      Stream<List<Folder>> folderStream = await FirebaseFirestore.instance
          .collection('folder')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Folder.fromJson(doc.data()))
              .toList());

      folderStream.listen((folderList) {
        refreshFolders(folderList);
      });
    }
  }

  void _refreshInformations(information) {
    setState(() {
      widget.infoCards.add(crd_Information(information));
    });
  }

  // ATUALIZA A LISTA DE INFORMAÇÕES DA PASTA
  void refreshInformations(List<Information> infos) {
    setState(() {

      for (Information info in infos) {
        widget.infoCards.add(crd_Information(info));
      }
    });
  }

  // ATUALIZA A LISTA DE BOTÕES/PASTAS DA PASTA
  void refreshFolders(List<Folder> folders) {
    setState(() {

      for (Folder folder in folders) {
        print(folder.key);
        widget.infoCards.add(btn_Theme(folder, ()=> {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FolderVisualizationScreen("PAGINA02"),
            ))
        }));
      }
    });
  }

  void _refreshFolders(newFolder) {
    setState(() {
      widget.folderButtons.add(btn_Theme(newFolder, () => {print(newFolder.name)}));
    });
  }
}

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
                  "Criar informação", () => {_refreshPageInformation(context, widget.fun)}),
              btn_maxWidth(
                  "Criar pasta", () => {_refreshPageFolder(context, widget.fun02)})
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
