import 'package:chat_messanger_app/widgets/appbar.dart';
import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/widgets/textfield.dart';

import 'package:chat_messanger_app/config/texts.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ignore: must_be_immutable
class ChangePassword extends StatefulWidget {
  String title;

  ChangePassword({super.key, required this.title});

  @override
  State<ChangePassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  bool isSwitched = true;

  bool currentPasswordVisible = true;
  bool newPasswordVisible = true;
  bool comfirmNewPasswordVisible = true;

  final currentPasswordController = TextEditingController();
  final comfirmNewPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final currentPasswordFocusNode = FocusNode();
  final comfirmNewPasswordFocusNode = FocusNode();
  final newPasswordFocusNode = FocusNode();

  final form = FormGroup({
    'currentPassword': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
    'newPassword': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
    'confirmNewPassword': FormControl<String>(),
  }, validators: [
    const MustMatchValidator('newPassword', 'confirmNewPassword', true)
  ]);

  @override
  void initState() {
    super.initState();
    currentPasswordVisible = false;
    newPasswordVisible = false;
    comfirmNewPasswordVisible = false;
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    comfirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppTitle(
          title: AppTexts.changePasword,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  // ---------- ReactiveForm ------------
                  // current password textfield
                  TextfieldOfProject(
                    formControlName: 'currentPassword',
                    prefIcon: 'lock.png',
                    icon: currentPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPressed: () {
                      setState(
                        () {
                          currentPasswordVisible = !currentPasswordVisible;
                          print(currentPasswordVisible);
                        },
                      );
                    },
                    controller: currentPasswordController,
                    focusNode: currentPasswordFocusNode,
                    hintText: AppTexts.password,
                    obscureText: !currentPasswordVisible,
                    requiredErrorText: 'The password mustn\'t be empty',
                    errorName: 'minLength',
                    errorText: 'The password must have at least 8 characters',
                    filled: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // new password textfield
                  TextfieldOfProject(
                    formControlName: 'newPassword',
                    prefIcon: 'lock.png',
                    icon: newPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPressed: () {
                      setState(
                        () {
                          newPasswordVisible = !newPasswordVisible;
                          print(newPasswordVisible);
                        },
                      );
                    },
                    controller: newPasswordController,
                    focusNode: newPasswordFocusNode,
                    hintText: AppTexts.newPasword,
                    obscureText: !newPasswordVisible,
                    filled: true,
                    requiredErrorText: 'The password mustn\'t be empty',
                    errorName: 'minLength',
                    errorText: 'New password must have at least 8 characters',
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // comfirm password textfield
                  TextfieldOfProject(
                    formControlName: 'confirmNewPassword',
                    prefIcon: 'lock.png',
                    icon: comfirmNewPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPressed: () {
                      setState(
                        () {
                          comfirmNewPasswordVisible =
                              !comfirmNewPasswordVisible;
                          print(comfirmNewPasswordVisible);
                        },
                      );
                    },
                    controller: comfirmNewPasswordController,
                    focusNode: currentPasswordFocusNode,
                    hintText: AppTexts.comfirmNewPasword,
                    obscureText: !comfirmNewPasswordVisible,
                    filled: true,
                    requiredErrorText: 'The password mustn\'t be empty',
                    errorName: 'minLength',
                    errorText:
                        'Comfirmed password must have at least 8 characters',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // submit button
                  Button(
                    onTap: () => print('Submit'),
                    text: 'SUBMIT',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
