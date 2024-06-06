import 'package:chat_messanger_app/config/colors.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String? title;
  const AppTitle({super.key, this.title});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: AppColors.colorSheme,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center title vertically
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  title != null ? Text(title!) : const Text(''),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ],
          ),
        ),
        titleTextStyle: const TextStyle(fontSize: 20, color: AppColors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
