import 'package:chat_messanger_app/widgets/button.dart';
import 'package:chat_messanger_app/widgets/textfield.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  String title;

  EditProfile({super.key, required this.title});

  @override
  State<EditProfile> createState() => _ChangePassword();
}

class _ChangePassword extends State<EditProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();

    super.dispose();
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
                        height: 70,
                      ),
                      const Text(
                        'Anna Adams',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        AppTexts.emailExample,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height - 10),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

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
        ),
        Positioned(
          top: 40,
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
                    fit: BoxFit.cover,
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
