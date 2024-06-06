import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:flutter/cupertino.dart';

/// Flutter code sample for [CupertinoTextField].

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  bool isShowTextField = false;

  final genders = ['Male', 'Female', 'Other'];
  int index = 1;
  String text = '';
  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    text = genders[index];
    scrollController = FixedExtentScrollController(initialItem: index);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isShowTextField = !isShowTextField;
                print(isShowTextField);
              });
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.evenLineColor),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/images/person.png',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(AppTexts.sex),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text(text)],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: isShowTextField,
            child: Column(
              children: [
                buildPicker(),
                const SizedBox(
                  height: 20,
                ),
                Button(
                  onTap: () {
                    setState(() {
                      scrollController.dispose();
                      scrollController =
                          FixedExtentScrollController(initialItem: index);

                      isShowTextField = false;
                    });
                  },
                  text: 'Submit',
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPicker() => SizedBox(
        height: 150,
        child: StatefulBuilder(
          builder: (context, setState) => CupertinoPicker(
            scrollController: scrollController,
            itemExtent: 64,
            looping: true,
            selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              background: AppColors.grey.withOpacity(0.2),
            ),
            onSelectedItemChanged: (index) {
              setState(() {
                this.index = index;
              });

              final gender = genders[index];
              text = gender;
            },
            children: List.generate(genders.length, (index) {
              final isSelected = this.index == index;
              final gender = genders[index];

              final color = isSelected ? AppColors.grey : AppColors.lightGrey;
              return Center(
                child: Text(
                  gender,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: color,
                  ),
                ),
              );
            }),
          ),
        ),
      );
}
