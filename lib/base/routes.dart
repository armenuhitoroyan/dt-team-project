import 'package:flutter/material.dart';
import 'package:chat_messanger_app/pages/homepage/homepage.dart';
import 'package:chat_messanger_app/pages/others/saves.dart';
import 'package:chat_messanger_app/pages/profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Messenger App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.homepage,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';
  static const saves = '/saves';
  static const camera = '/camera';
  static const profile = '/profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      AppRoutes.homepage: (context) => Homepage(
            title: 'Home Page',
          ),
      AppRoutes.saves: (context) => Saves(
            title: 'Saves',
          ),
      AppRoutes.profile: (context) => Profile(
            title: 'Profile',
          ),
    };

    WidgetBuilder? builder = routes[settings.name];
    if (builder == null) {
      // You can handle undefined routes here
      throw Exception('Invalid route: ${settings.name}');
    }

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
