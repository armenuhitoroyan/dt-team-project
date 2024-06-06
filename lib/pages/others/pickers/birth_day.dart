import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [CupertinoTextField].

class BirthDay extends StatefulWidget {
  const BirthDay({super.key});

  @override
  State<BirthDay> createState() => _BirthDayState();
}

class _BirthDayState extends State<BirthDay> {
  late TextEditingController _textController;
  String text = '0';
  bool isShowTextField = false;
  final buttonWidth = 320.0;
  String birthYear = '';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
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
                          'assets/images/cake.png',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(AppTexts.birthYear),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      birthYear != ''
                          ? Text(
                              birthYear,
                              style: const TextStyle(color: AppColors.grey),
                            )
                          : const Text(
                              '2000',
                              style: TextStyle(color: AppColors.grey),
                            ),
                    ],
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
                const SizedBox(
                  height: 20,
                ),
                _openDatePicker(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _openDatePicker(BuildContext context) {
    return BottomPicker.date(
      pickerTitle: const Text(
        'Set your Birthday',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(1900, 1, 1),
      gradientColors: const [
        AppColors.colorSheme,
        Color(0xFF95C59A),
      ],
      maxDateTime: DateTime.now(),
      minDateTime: DateTime(1900),
      pickerTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onSubmit: (selectedDate) {
        String date = selectedDate.toString();

        setState(() {
          for (var i = 0; i < 4; i++) {
            birthYear += date[i];
          }
        });
        print(birthYear);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    );
  }
}
