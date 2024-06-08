import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:chat_messanger_app/model/food.dart';
import 'package:chat_messanger_app/pages/others/more_info_page.dart';
import 'package:chat_messanger_app/widgets/appbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MorePage extends StatefulWidget {
  String title;
  final FoodModel foodList;

  MorePage({super.key, required this.title, required this.foodList});

  @override
  State<MorePage> createState() => _MorePageState(foodList: foodList);
}

class _MorePageState extends State<MorePage> {
  FoodModel foodList;
  // final List<String> food = <String>[
  //   'CHICKEN BREAT',
  //   'LETTUCE',
  //   'TOMATO',
  //   'PARMESAN CHEESE'
  // ];
  final List<String> weight = <String>['35g', '20g', '25g', '20g'];

  _MorePageState({required this.foodList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppTitle(
          title: AppTexts.more,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            // ************
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                            left: 10.0,
                          ),
                          child: Image.asset(
                            'assets/images/${foodList.image}',
                          ),
                        ),
                        Column(
                          children: [
                            foodList.name != null
                                ? Text(
                                    foodList.name!,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const Text(''),
                            foodList.date != null
                                ? Text(
                                    foodList.date!,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  )
                                : const Text(''),
                            foodList.calorie != null
                                ? Text(
                                    '${foodList.calorie} cal.',
                                    style: const TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.green,
                                    ),
                                  )
                                : const Text('')
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Container()),
                                ],
                              ),
                            ),
                            // ------------------------------------
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(), // Divider as separator
                ],
              ),
            ),
            foodList.dishContents != null
                ? Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: foodList.dishContents!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 21,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MoreInfo(
                                      title: 'More Info',
                                      foodList: foodList,
                                      index: index,
                                    ),
                                  ),
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    foodList.dishContents![index]
                                            ["component-name"]
                                        .toString()
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3.5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${foodList.dishContents![index]["calorie"].toString()}g',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
