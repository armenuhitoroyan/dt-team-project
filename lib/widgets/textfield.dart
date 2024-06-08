import 'package:chat_messanger_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TextfieldOfProject extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? formControlName;
  final bool obscureText;
  final String prefIcon;
  final IconData? icon;
  final String? requiredErrorText;
  final String? errorName;
  final String? errorText;
  final FocusNode? focusNode;
  final bool? visiblePassword;
  final bool? alignLabelWithHint;
  final bool? filled;

  final VoidCallback? onPressed;

  const TextfieldOfProject(
      {super.key,
      required this.controller,
      this.formControlName,
      required this.hintText,
      required this.obscureText,
      required this.prefIcon,
      this.requiredErrorText,
      this.focusNode,
      this.errorName,
      this.errorText,
      this.onPressed,
      this.icon,
      this.visiblePassword,
      this.alignLabelWithHint,
      this.filled});
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      validationMessages: {
        'required': (error) => requiredErrorText ?? '',
        '$errorName': (error) => errorText ?? ''
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/images/$prefIcon',
            )),
        suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: AppColors.grey,
            )),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: AppColors.white,
        filled: filled,
        alignLabelWithHint: alignLabelWithHint,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
