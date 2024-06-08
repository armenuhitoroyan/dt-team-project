import 'package:chat_messanger_app/base/routes.dart';
import 'package:chat_messanger_app/services/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SignInProvider extends ChangeNotifier {
  bool showPassword = false;
  bool isSwitched = true;
  bool isCorrectEmailAndPassword = false;

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

  Future<void> signIn() async {
    print('Hello World!');
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.pushNamed(context, AppRoutes.navbar);
      isCorrectEmailAndPassword = true;
    } catch (e) {
      isCorrectEmailAndPassword = false;
      print('The email address or password is incorrect. Please retry...');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //         'The email address or password is incorrect. Please retry...'),
      //   ),
      // );
    }
    notifyListeners();
  }
}
