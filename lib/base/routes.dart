import 'package:chat_messanger_app/pages/homepage/homepage.dart';
import 'package:chat_messanger_app/pages/others/saves.dart';
import 'package:chat_messanger_app/pages/profile/profile.dart';
import 'package:chat_messanger_app/widgets/navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
// import 'package:food_shop/pages/camera/camera.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';

  static const saves = '/saves';
  static const camera = '/camera';
  static const profile = '/profile';
  static const navbar = '/navbar';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;

    var routes = <String, WidgetBuilder>{
      AppRoutes.homepage: (context) => const Homepage(
          // title: 'Home Page',
          ),
      AppRoutes.saves: (context) => const Saves(
          // title: 'Saves',
          ),
      // AppRoutes.camera: (context) => const TakePictureScreen(
      //       camera: CameraDescription(
      //         name: 'camera',
      //         lensDirection: CameraLensDirection.back,
      //         sensorOrientation: 1,
      //       ),
      //     ),
      AppRoutes.profile: (context) => const Profile(
          // title: 'Profile',
          ),
      AppRoutes.navbar: (context) => BottomNavbar()
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
