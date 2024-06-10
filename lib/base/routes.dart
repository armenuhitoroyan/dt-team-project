import 'package:chat_messanger_app/pages/homepage/homepage.dart';
import 'package:chat_messanger_app/pages/others/saves.dart';
import 'package:chat_messanger_app/pages/profile/profile.dart';
import 'package:chat_messanger_app/pages/scan/camera.dart';
import 'package:chat_messanger_app/services/auth/auth_gate.dart';
import 'package:chat_messanger_app/widgets/navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
// import 'package:food_shop/pages/camera/camera.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';

  static const saves = '/saves';
  static const camera = '/camera';
  // static const generateQRCode = '/generateqrcode';
  static const profile = '/profile';
  static const navbar = '/navbar';
  static const authGate = '/Authgate';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;

    var routes = <String, WidgetBuilder>{
      AppRoutes.homepage: (context) => const Homepage(),
      AppRoutes.saves: (context) => const Saves(),
      AppRoutes.camera: (context) => const Camera(),
      AppRoutes.profile: (context) => const Profile(),
      AppRoutes.navbar: (context) => BottomNavbar(),
      AppRoutes.authGate: (context) => AuthGate()
    };

    WidgetBuilder builder = routes[settings.name] ?? routes.values.first;
    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

class PageArguments {
  final String? pageTitle;
  final Map<String, dynamic>? data;

  PageArguments({
    this.pageTitle,
    this.data,
  });
}
