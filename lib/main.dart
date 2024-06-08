import 'package:chat_messanger_app/base/routes.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/firebase_options.dart';

import 'package:chat_messanger_app/services/auth/auth_gate.dart';

import 'package:chat_messanger_app/services/auth/auth_service.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorSheme),
        useMaterial3: true,
      ),
      home: AuthGate(),
    );
  }
}
