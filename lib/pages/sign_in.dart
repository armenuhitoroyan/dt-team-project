import 'package:chat_messanger_app/base/providers/sign_in_provider.dart';

import 'package:chat_messanger_app/pages/auth/reset_password.dart';
import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/widgets/textfield.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
// import 'package:flutter/widgets.dart';

class SignInPage extends StatelessWidget {
  final void Function()? onTap;
  SignInPage({
    super.key,
    required this.onTap,
  });

  final passwordFocusNode = FocusNode();

  final form = FormGroup({
    'email': FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        const MinLengthValidator(8),
      ],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          SignInProvider(context: context, onTap: onTap),
      child: Consumer<SignInProvider>(builder: (context, value, child) {
        return Scaffold(
          backgroundColor: AppColors.lightGrey,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:
                      // Consumer<SignInProvider>(
                      //   builder: (context, value, child) =>
                      Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),

                      // welcome back
                      const Row(
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      ReactiveForm(
                        formGroup: form,
                        child: Column(
                          children: [
                            // email textfield
                            TextfieldOfProject(
                              formControlName: 'email',
                              prefIcon: 'mail.png',
                              controller: value.emailController,
                              hintText: AppTexts.mail,
                              obscureText: false,
                              requiredErrorText: 'The email mustn\'t be empty',
                              errorName: 'email',
                              errorText:
                                  'The email value must be a valid email',
                              filled: true,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // password textfield
                            TextfieldOfProject(
                              formControlName: 'password',
                              prefIcon: 'lock.png',
                              icon: value.showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onPressed: () => value.onShowPassword(),
                              controller: value.passwordController,
                              focusNode: passwordFocusNode,
                              hintText: AppTexts.password,
                              obscureText: !value.showPassword,
                              requiredErrorText:
                                  'The password mustn\'t be empty',
                              errorName: 'minLength',
                              errorText:
                                  'The password must have at least 8 characters',
                              filled: true,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      // Swich adapter
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Switch.adaptive(
                                  value: value.isSwitched,
                                  onChanged: (bool isSwitched) {
                                    value.onClickSwitch();
                                    value.isSwitched = isSwitched;
                                  },
                                  trackColor: value.isSwitched
                                      ? MaterialStateProperty.all(
                                          AppColors.colorSheme)
                                      : MaterialStateProperty.all(
                                          AppColors.lightGrey),
                                  thumbColor: value.isSwitched
                                      ? MaterialStateProperty.all(
                                          AppColors.white)
                                      : MaterialStateProperty.all(
                                          AppColors.grey),
                                ),
                              ),
                              const Text(
                                'Remember me',
                                // style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResetPasword(
                                          title: "Reset Password")),
                                ),
                                child: Text(
                                  AppTexts.forgotPasword,
                                  style:
                                      const TextStyle(color: AppColors.black),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      // sign_in button
                      Button(
                        onTap: () {
                          // context.read<SignInProvider>().signIn();
                          value.signIn();
                        },
                        text: 'Sign In',
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      Column(
                        children: [
                          Text(
                            AppTexts.or,
                            style: const TextStyle(
                              color: AppColors.grey, /* fontSize: 20.0 */
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/google.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  AppTexts.loginWithGoogle,
                                  style: const TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  // ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Dont have an account? ',
                // style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 15,
              ),
              // GestureDetector(
              //   onTap: () => value.onTap,
              //   child: const Text(
              //     'Sign Up',
              //     style: TextStyle(
              //       // fontWeight: FontWeight.bold,
              //       color: AppColors.colorSheme,
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: value.onTap,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
