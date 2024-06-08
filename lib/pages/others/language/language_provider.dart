// import 'package:chat_messanger_app/base/api/project_api.dart';
// import 'package:chat_messanger_app/model/language_model.dart';
// import 'package:flutter/material.dart';

// class LanguageProvider extends ChangeNotifier {
//   LanguageModel? languageModel;
//   bool isLoading = false;
//   bool isVisible = false;
//   bool isShow = false;

//   LanguageProvider() {
//     getData();
//   }

//   void getData({bool initial = true}) async {
//     isLoading = true;
//     if (!initial) notifyListeners();

//     final result = await ProjectAPI().languageApi.getLanguages();

//     // print(result);

//     if (result.isNotEmpty) {
//     } else {
//       isLoading = false;
//       languageModel = result.first;
//       print('name => ${languageModel?.name}');

//       notifyListeners();
//     }

//     notifyListeners();
//   }

//   visibleTextField() {
//     isVisible = !isVisible;
//     notifyListeners();
//     return isVisible;
//   }

//   show() {
//     isShow = true;
//     notifyListeners();
//   }
// }

import 'package:chat_messanger_app/base/api/project_api.dart';
import 'package:chat_messanger_app/model/language_model.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  bool isLoading = true;
  List<LanguageModel> list = [];

  LanguageProvider() {
    getData();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await ProjectAPI().languageApi.getLanguages();

    if (result.isEmpty) {
    } else {
      isLoading = false;
      list = result;

      // print(list.first.languages?.first);

      list.forEach((e) {
        print(e.languages?.first);
      });

      notifyListeners();
    }

    notifyListeners();
  }
}
