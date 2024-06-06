import 'package:chat_messanger_app/base/api/food_api.dart';
import 'package:chat_messanger_app/base/api/language_api.dart';
import 'package:dio/dio.dart';

class ProjectAPI {
  static ProjectAPI? _singleton;

  late LanguageApi languageApi;
  late FoodApi foodApi;

  Dio appDioClient = Dio();

  factory ProjectAPI() {
    _singleton ??= ProjectAPI._internal();
    return _singleton!;
  }

  ProjectAPI._internal() {
    // Init subclasses
    languageApi = LanguageApi(appDioClient);
    foodApi = FoodApi(appDioClient);
  }
}
