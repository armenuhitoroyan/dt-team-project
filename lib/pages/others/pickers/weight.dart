import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:flutter/cupertino.dart';

/// Flutter code sample for [CupertinoTextField].

class TextFieldOfWeight extends StatefulWidget {
  const TextFieldOfWeight({super.key});

  @override
  State<TextFieldOfWeight> createState() => _TextFieldOfWeightState();
}

class _TextFieldOfWeightState extends State<TextFieldOfWeight> {
  late TextEditingController _textController;
  String text = '0';
  bool isShowTextField = false;

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
                          'assets/images/game_icon.png',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(AppTexts.weight),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('${text}w')],
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
                CupertinoTextField(
                  controller: _textController,
                  placeholder: "Submit",
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                  onTap: () {
                    setState(() {
                      print(_textController.text);
                      text = _textController.text;
                      isShowTextField = false;
                    });
                  },
                  text: 'Enter your weight',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
