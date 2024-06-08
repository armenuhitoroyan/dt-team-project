import 'package:chat_messanger_app/base/routes.dart';
import 'package:chat_messanger_app/services/auth/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInProvider extends ChangeNotifier {
  bool showPassword = false;
  bool isSwitched = true;
  bool isInCorrectEmailAndPassword = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordVisible = true;
  final passwordFocusNode = FocusNode();
  BuildContext context;

  final void Function()? onTap;

  SignInProvider({required this.context, required this.onTap});

  void onClickSwitch() {
    isSwitched = false;
    notifyListeners();
  }

  void onShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    print('Hello World!');
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.pushNamed(context, AppRoutes.navbar);
    } catch (e) {
      isInCorrectEmailAndPassword = true;
      print('The email address or password is incorrect. Please retry...');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect email or password'),
        ),
      );
    }
    notifyListeners();
  }
}
