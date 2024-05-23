import 'dart:async';

import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

// ignore: must_be_immutable
class Verification extends StatefulWidget {
  String title;

  Verification({super.key, required this.title});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool _onEditing = true;
  String? _code;
  int _remainingTime = 20;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_remainingTime == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 29.0, top: 30.0),
          child: Text(''),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          color: AppColors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppTexts.verification,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      AppTexts.verificationText,
                      style: const TextStyle(fontSize: 19),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  VerificationCode(
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.w900),
                    keyboardType: TextInputType.number,
                    underlineColor: AppColors.colorSheme,
                    length: 4,
                    cursorColor: AppColors.grey,
                    autofocus: true,
                    fullBorder: true,
                    digitsOnly: true,
                    underlineUnfocusedColor: AppColors.grey,
                    margin: const EdgeInsets.all(12),
                    onCompleted: (String value) {
                      setState(() {
                        _code = value;
                      });
                    },
                    onEditing: (bool value) {
                      setState(() {
                        _onEditing = value;
                      });
                      if (!_onEditing) FocusScope.of(context).unfocus();
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Button(
                          onTap: () => print,
                          text: 'Continue',
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: _onEditing
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Re-send code in '),
                                    Text(
                                      '0:$_remainingTime',
                                      style: const TextStyle(
                                          color: AppColors.colorSheme),
                                    )
                                  ],
                                )
                              : Text('Your code: $_code'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
