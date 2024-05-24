class FoodModel {
  String? id;
  String? name;
  String? image;
  String? date;
  // List<Map<String, dynamic>>? dishContents;
  List? dishContents;
  int? calorie;

  FoodModel(
      {this.id,
      this.name,
      this.image,
      this.date,
      this.dishContents,
      this.calorie});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    date = json['date'];
    dishContents = json['dish-contents'];
    calorie = json['calorie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;

    data['name'] = name;
    data['image'] = image;
    data['date'] = date;
    data['dish-contents'] = dishContents;
    data['calorie'] = calorie;

    return data;
  }
}
