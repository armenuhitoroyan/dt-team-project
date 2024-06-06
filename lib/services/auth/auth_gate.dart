// import 'package:chat_messanger_app/pages/profile/contacts.dart';
import 'package:chat_messanger_app/services/login_or_register.dart';
import 'package:chat_messanger_app/widgets/navbar/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return BottomNavbar();
            // Contacts();
          } else {
            return const LoginOrRegisterPage();
          }

          // user is not logged in
        },
      ),
    );
  }
}
