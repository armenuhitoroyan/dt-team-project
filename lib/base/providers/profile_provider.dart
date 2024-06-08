import 'package:chat_messanger_app/base/providers/sign_in_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends ChangeNotifier {
  BuildContext context;

  ProfileProvider({required this.context});

  Future<void> getData(BuildContext context) async {
    final signInProvider = Provider.of<SignInProvider>(context, listen: false);

    try {
      await signInProvider.signIn(context);
      print(signInProvider.emailController.text);
    } catch (e) {
      print('Provider Error');
    }
    notifyListeners();
  }
}
