import 'package:chat_messanger_app/config/texts.dart';
import 'package:chat_messanger_app/pages/others/saves/saves_provider.dart';
import 'package:chat_messanger_app/widgets/appbar.dart';
import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/pages/others/more_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Saves extends StatefulWidget {
  String title;

  Saves({super.key, required this.title});

  @override
  State<Saves> createState() => _SavesState();
}

class _SavesState extends State<Saves> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SavesProvider(),
      // Provider-ից տվյալները ստացի։
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppTitle(
            title: AppTexts.saves,
          ),
        ),
        body: SafeArea(
          child: Consumer<SavesProvider>(
            // ignore: unnecessary_null_comparison
            builder: (context, value, child) => value != null &&
                    // ignore: unnecessary_null_comparison
                    value.list != null
                ? ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: value.list.length, //.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                                'assets/images/${value.list[index].image}',
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                value.list[index].name != null
                                    ? Text(
                                        value.list[index].name!,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Text(''),
                                value.list[index].date != null
                                    ? Text(
                                        value.list[index].date!,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      )
                                    : const Text(''),
                                value.list[index].calorie != null
                                    ? Text(
                                        '${value.list[index].calorie} cal.',
                                        style: const TextStyle(
                                          fontSize: 22.0,
                                          color: AppColors.colorSheme,
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
                                  width: 120,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Image.asset(
                                          'assets/images/trash.png',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Button(
                                          text: 'MORE',
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MorePage(
                                                title: 'Food',
                                                foodList: value.list[index],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
