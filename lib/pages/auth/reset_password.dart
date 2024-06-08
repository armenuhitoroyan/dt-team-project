import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/widgets/textfield.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ignore: must_be_immutable
class ResetPasword extends StatefulWidget {
  String title;

  ResetPasword({super.key, required this.title});

  @override
  State<ResetPasword> createState() => _ResetPasword();
}

class _ResetPasword extends State<ResetPasword> {
  bool isSwitched = true;
  final emailController = TextEditingController();

  final form = FormGroup({
    'email': FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.email,
    ]),
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  sendEmail() async {
    try {
      // showLoader(context);
      String emailAddress = emailController.text; // email address
      print(emailAddress);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () => print,
          icon: const Icon(Icons.arrow_back),
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
                            AppTexts.resetPasword,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          AppTexts.inputData,
                          style: const TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // ---------- ReactiveForm ------------
                // email textfield
                ReactiveForm(
                  formGroup: form,
                  child: TextfieldOfProject(
                    formControlName: 'email',
                    prefIcon: 'mail.png',
                    controller: emailController,
                    hintText: AppTexts.mail,
                    obscureText: false,
                    requiredErrorText: 'The email mustn\'t be empty',
                    errorName: 'email',
                    errorText: 'The email value must be a valid email',
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Button(
                  onTap: () => sendEmail(),
                  text: 'SEND',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
