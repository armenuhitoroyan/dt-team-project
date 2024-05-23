// import 'package:camera/camera.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:chat_messanger_app/widgets/bottom_navbar.dart';
import 'package:chat_messanger_app/widgets/carousel/carousel_with_indicator_demo.dart';
import 'package:chat_messanger_app/widgets/carousel/carousel_with_width.dart';
import 'package:flutter/material.dart';
// import 'package:food_shop/base/routes.dart';

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  String title;

  Homepage({super.key, required this.title});

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  // int _selectedIndex = 0;

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 62,
              child: Container(
                height: 21,
                color: const Color(0xFFD9D9D9),
                child: const Center(
                    child: Text(
                  'Logo',
                  style: TextStyle(fontSize: 16),
                )),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                width: 135,
                height: 21,
              ),
              child: ElevatedButton(
                onPressed: () => print('Get premium'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD600),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'Get Premium',
                        style: TextStyle(fontSize: 12, color: AppColors.black),
                      ),
                    ),
                    Image.asset(
                      'assets/images/crown.png',
                      width: 15,
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 21,
              child: Image.asset(
                'assets/images/call.png',
              ),
            ),
          ],
        ),
        titleTextStyle: const TextStyle(fontSize: 24, color: AppColors.black),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppTexts.today,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(child: CarouselWithIndicatorDemo()),
              const Expanded(child: CarouselWithWidth())
            ],
          )),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
