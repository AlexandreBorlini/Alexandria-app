class Folder {
  String name;
  String? key;
  List<String> informationIdList;
  List<String> folderIdList;

  Folder({
    required this.name,
    required this.informationIdList,
    required this.folderIdList
  });

  Folder.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        informationIdList = json['informationIdList'].isEmpty ? [] : json['informationIdList'],
        folderIdList = json['folderIdList'].isEmpty ? [] : json['folderIdList'],
        key = json.;
}
//
// FirebaseFirestore.instance
//     .collectionGroup("campaigns")
// .where('campaignCategory', isEqualTo:filterBusinessResult)

class Information {
  String title;
  String information;
  String reference;

  Information({
    required this.title,
    required this.information,
    required this.reference
  });

  Information.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        information = json['information'],
        reference = json['reference'];
}