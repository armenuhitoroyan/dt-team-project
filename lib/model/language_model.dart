// class LanguageModel {
//   LanguageModel({
//     this.country,
//     this.language,
//   });

//   String? country;
//   String? language;

//   factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
//         country: json["country"],
//         language: json["language"],
//       );

//   Map<String, dynamic> toJson() => {
//         "country": country,
//         "language": language,
//       };
// }

class LanguageModel {
  String? id;
  String? name;
  List<dynamic>? languages;

  LanguageModel({this.id, this.name, this.languages});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    languages = json['languages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;

    data['name'] = name;
    data['languages'] = languages;

    return data;
  }
}
