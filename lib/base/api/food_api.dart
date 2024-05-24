import 'package:chat_messanger_app/model/food.dart';
import 'package:dio/dio.dart';

class FoodApi {
  final Dio appDioClient;

  FoodApi(
    this.appDioClient,
  );

  Future<List<FoodModel>> getFoodes() async {
    List<FoodModel> foodList = [];

    final result = await appDioClient.get(
      '../../../assets/food.json',
    );

    // print(result.runtimeType);

    if (result.data is List) {
      // print('data: ${result.data}');
      foodList = result.data
          .map<FoodModel>(
            (e) => FoodModel.fromJson(e),
          )
          .toList();

      // print('foodList => ${foodList}');
    }

    return foodList;
  }
}
