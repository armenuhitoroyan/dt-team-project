import 'package:chat_messanger_app/model/language_model.dart';
import 'package:dio/dio.dart';

class LanguageApi {
  final Dio appDioClient;

  LanguageApi(
    this.appDioClient,
  );

  Future<List<LanguageModel>> getLanguages() async {
    List<LanguageModel> languageBordList = [];

    final result = await appDioClient.get(
      '../../../assets/countries.json',
    );

    // print(result.runtimeType);

    if (result.data is List) {
      // print('data: ${result.data}');
      languageBordList = result.data
          .map<LanguageModel>(
            (e) => LanguageModel.fromJson(e),
          )
          .toList();

      // print('languageBordList => ${languageBordList}');
    }

    return languageBordList;
  }
}
