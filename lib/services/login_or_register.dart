// import 'package:chat_messanger_app/components/button.dart';
// import 'package:chat_messanger_app/components/textfield.dart';
import 'package:chat_messanger_app/pages/sign_in.dart';
import 'package:chat_messanger_app/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({
    super.key,
  });

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // initially show the login page
  bool showLoginPage = true;

  // toggle beetwen login or register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignInPage(onTap: togglePages);
    } else {
      return SignUpPage(onTap: togglePages);
    }
  }
}
