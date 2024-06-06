import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/widgets/textfield.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:chat_messanger_app/pages/sign_in.dart';
import 'package:chat_messanger_app/services/auth/auth_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;
  const SignUpPage({
    super.key,
    required this.onTap,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordVisible = true;
  bool comfirmPasswordVisible = true;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmPasswordController = TextEditingController();

  final passwordFocusNode = FocusNode();
  final comfirmPasswordFocusNode = FocusNode();

  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
    'passwordConfirmation': FormControl<String>(),
  }, validators: [
    const MustMatchValidator('password', 'passwordConfirmation', true)
  ]);

  @override
  void initState() {
    super.initState();
    comfirmPasswordVisible = false;
    passwordVisible = false;
  }

  @override
  void dispose() {
    passwordController.dispose();
    comfirmPasswordController.dispose();
    super.dispose();
  }

  void signUp() async {
    if (passwordController.text != comfirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords don\'t match'),
        ),
      );

      return;
    }

    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        title: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            MaterialPageRoute(
              builder: (context) => SignInPage(
                onTap: () => print('Sign in'),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // create account
                  const Row(
                    children: [
                      Text(
                        'Sign Up',
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
                        // fullname textfield
                        TextfieldOfProject(
                          formControlName: 'name',
                          prefIcon: 'profile.png',
                          controller: nameController,
                          hintText: 'Full name',
                          obscureText: false,
                          requiredErrorText: 'The email mustn\'t be empty',
                          errorName: 'name',
                          errorText: 'Name must contain letters',
                          filled: true,
                        ),

                        const SizedBox(
                          height: 15,
                        ),

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
                          alignLabelWithHint: false,
                          filled: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // Comfirm password textfield
                        TextfieldOfProject(
                          formControlName: 'passwordConfirmation',
                          prefIcon: 'lock.png',
                          icon: comfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onPressed: () {
                            setState(
                              () {
                                comfirmPasswordVisible =
                                    !comfirmPasswordVisible;
                                print(comfirmPasswordVisible);
                              },
                            );
                          },
                          focusNode: comfirmPasswordFocusNode,
                          requiredErrorText: 'The password mustn\'t be empty',
                          errorName: 'minLength',
                          errorText:
                              'The password must have at least 8 characters',
                          controller: comfirmPasswordController,
                          hintText: AppTexts.comfirmPasword,
                          obscureText: !comfirmPasswordVisible,
                          filled: true,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),

                  // sign_un button
                  Button(onTap: () => signUp(), text: 'Sign Up'),
                  const SizedBox(
                    height: 30,
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
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
        children: [
          Text(
            AppTexts.existingAccount,
            // style: const TextStyle(
            //   fontWeight: FontWeight.bold,
            // ),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Text(
              AppTexts.signIn,
              style: const TextStyle(
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
