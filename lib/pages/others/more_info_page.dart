import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:chat_messanger_app/model/food.dart';
import 'package:chat_messanger_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MoreInfo extends StatefulWidget {
  String title;
  final FoodModel foodList;

  int index;

  MoreInfo(
      {super.key,
      required this.title,
      required this.foodList,
      required this.index});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppTitle(
          title: AppTexts.moreInfo,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 150,
                      child: Column(
                        children: [
                          Expanded(
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
                                  child:
                                      // Text(
                                      //     '${widget.foodList.dishContents![widget.index]["image"]}'),
                                      widget.foodList.dishContents![
                                                      widget.index]["image"] !=
                                                  null &&
                                              widget.foodList.dishContents![
                                                      widget.index]["image"] !=
                                                  ""
                                          ? Image.asset(
                                              'assets/images/${widget.foodList.dishContents![widget.index]["image"]}',
                                            )
                                          : Container(),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: [
                                    widget.foodList.dishContents![widget.index]
                                                    ["component-name"] !=
                                                null &&
                                            widget.foodList.dishContents![widget
                                                    .index]["component-name"] !=
                                                ""
                                        ? Text(
                                            widget
                                                .foodList
                                                .dishContents![widget.index]
                                                    ["component-name"]
                                                .toString()
                                                .toUpperCase(),
                                            style: const TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : const Text(''),
                                    const Text(
                                      'Proteins - 1.1g',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    const Text(
                                      'Fats - 0.2g',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    const Text(
                                      'Carbohydrates - 3.7g',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Text(
                                              '${widget.foodList.dishContents![widget.index]["calorie"]}cal',
                                              style: const TextStyle(
                                                fontSize: 22.0,
                                                color: AppColors.colorSheme,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Tomatoes are herbaceous annuals (less commonly, perennials) of the Solanaceae family. Tomato fruits are berries, also called tomatoes. This name comes from the Italian word pomo d`oro, which literally means “golden apple”. The plant owes its name to the ancient Aztecs, who used the term tomatl, which the French changed to tomate. South America is considered the birthplace of tomatoes, where wild forms of tomatoes (calorizator) have been preserved to this day. The plant came to Europe by sea, was grown as an ornamental, and for some time tomatoes were considered not only inedible, but also poisonous fruits. Only in the 17th century did chefs begin to prepare dishes from fresh and heat-treated tomatoes.',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
