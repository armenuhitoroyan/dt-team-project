import 'package:chat_messanger_app/base/routes.dart';
import 'package:chat_messanger_app/pages/auth/reset_password.dart';
import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/widgets/textfield.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:chat_messanger_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
// import 'package:flutter/widgets.dart';

class SignInPage extends StatefulWidget {
  final void Function()? onTap;
  const SignInPage({
    super.key,
    required this.onTap,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordVisible = true;
  bool isSwitched = true;
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
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    // get the auth service

    print('Hello World!');

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.pushNamed(context, AppRoutes.navbar);
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
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
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
                          controller: emailController,
                          hintText: AppTexts.mail,
                          obscureText: false,
                          requiredErrorText: 'The email mustn\'t be empty',
                          errorName: 'email',
                          errorText: 'The email value must be a valid email',
                          filled: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // password textfield
                        TextfieldOfProject(
                          formControlName: 'password',
                          prefIcon: 'lock.png',
                          icon: passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                                print(passwordVisible);
                              },
                            );
                          },
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          hintText: AppTexts.password,
                          obscureText: !passwordVisible,
                          requiredErrorText: 'The password mustn\'t be empty',
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
                              value: true,
                              onChanged: (bool isSwitched) {
                                print(!isSwitched);
                              },
                              trackColor: MaterialStateProperty.all(
                                  AppColors.colorSheme),
                              thumbColor:
                                  MaterialStateProperty.all(AppColors.white),
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
                                  builder: (context) =>
                                      ResetPasword(title: "Reset Password")),
                            ),
                            child: Text(
                              AppTexts.forgotPasword,
                              style: const TextStyle(color: AppColors.black),
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
                    onTap: () => signIn(),
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
          GestureDetector(
            onTap: widget.onTap,
            child: const Text(
              'Sign Up',
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: AppColors.colorSheme,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
