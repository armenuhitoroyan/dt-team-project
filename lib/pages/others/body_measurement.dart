import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/pages/others/pickers/birth_day.dart';
import 'package:chat_messanger_app/pages/others/pickers/gender.dart';

import 'package:chat_messanger_app/pages/others/pickers/height.dart';
import 'package:chat_messanger_app/pages/others/pickers/weight.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodyMeasurements extends StatefulWidget {
  String title;

  BodyMeasurements({super.key, required this.title});

  @override
  State<BodyMeasurements> createState() => _BodyMeasurements();
}

class _BodyMeasurements extends State<BodyMeasurements> {
  bool isVisibleBirthDay = false;
  var year = 0;

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
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 29.0, top: 30.0),
          child: Text('Body Measurements'),
        ),
        titleTextStyle: const TextStyle(fontSize: 24, color: AppColors.black),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.evenLineColor),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ********************
            GenderPage(),
            BirthDay(),
            TextFieldOfWeight(),
            TextFieldOfHeight(),
          ],
        ),
      ),
    );
  }
}
