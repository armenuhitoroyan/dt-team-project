import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:chat_messanger_app/pages/auth/change_password.dart';
import 'package:chat_messanger_app/pages/others/body_measurement.dart';
import 'package:chat_messanger_app/pages/others/language/language.dart';
import 'package:chat_messanger_app/pages/others/privacy/privacy_policy.dart';
import 'package:chat_messanger_app/pages/profile/edit_profile.dart';
import 'package:chat_messanger_app/services/auth/auth_service.dart';
import 'package:chat_messanger_app/widgets/navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void onGoContactsPage() async {
    // get the auth service

    print('Hello World!');

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: SafeArea(
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
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // *********** image **********
                        ],
                      ),
                    ],
                  ),
                ),
                titleTextStyle:
                    const TextStyle(fontSize: 20, color: AppColors.white),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 20.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 400,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        const Text(
                          'Anna Adams',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          AppTexts.emailExample,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        // ---------- To do menu ------------
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfile(
                                                      title: 'Edit Profile',
                                                    )),
                                          ),
                                      child: const Text(
                                        'Edit profile information',
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BodyMeasurements(
                                                      title:
                                                          'Body measurements',
                                                    )),
                                          ),
                                      child: const Text(
                                        'Body measurements',
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangePassword(
                                                      title: 'Change Password',
                                                    )),
                                          ),
                                      child: const Text(
                                        'Change Password',
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfile(
                                                      title: 'Notifications',
                                                    )),
                                          ),
                                      child: const Text(
                                        'Notifications',
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Languages(
                                                      title: 'Language',
                                                    )),
                                          ),
                                      child: const Text(
                                        'Language',
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () => onGoContactsPage(),
                                      child: const Text(
                                        'Contact Us',
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PrivacyPolicy(
                                                      title: 'Privacy policy',
                                                    )),
                                          ),
                                      child: const Text(
                                        'Privacy policy',
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // BottomNavbar(),
              ],
            ),
          ),
          // bottomNavigationBar: BottomNavbar(),
        ),
        Positioned(
          top: 50,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/user.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
