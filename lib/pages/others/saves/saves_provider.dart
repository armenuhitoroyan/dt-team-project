import 'package:chat_messanger_app/base/api/project_api.dart';
import 'package:chat_messanger_app/model/food.dart';
import 'package:flutter/material.dart';

class SavesProvider extends ChangeNotifier {
  bool isLoading = true;
  List<FoodModel> list = [];

  SavesProvider() {
    getData();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await ProjectAPI().foodApi.getFoodes();

    if (result.isEmpty) {
    } else {
      isLoading = false;
      list = result;

      list.forEach((e) {
        print(e.name);
      });

      notifyListeners();
    }

    notifyListeners();
  }
}
