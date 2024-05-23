import 'package:chat_messanger_app/base/routes.dart';
import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/pages/homepage/homepage.dart';
import 'package:flutter/material.dart';

// import 'package:food_shop/pages/homepage/my_homepage.dart';

// ignore: must_be_immutable
class BottomNavbar extends StatefulWidget {
  const BottomNavbar({
    super.key,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  int _selectedIndex = 0;

  Future<void> _onItemTapped(int index) async {
    WidgetsFlutterBinding.ensureInitialized();

    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          Navigator.pushNamed(context, AppRoutes.homepage);
          break;
        case 1:
          Navigator.pushNamed(context, AppRoutes.saves);
          break;
        case 2:
          // Navigator.pushNamed(context, AppRoutes.camera);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(
                title: 'Home Page',
              ),
            ),
          );
          break;
        case 3:
          Navigator.pushNamed(context, AppRoutes.profile);
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Saves',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_outlined),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_outlined),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.colorSheme,
      unselectedItemColor: AppColors.grey,
      selectedLabelStyle: const TextStyle(color: AppColors.colorSheme),
      unselectedLabelStyle: const TextStyle(color: AppColors.grey),
      onTap: _onItemTapped,
    );
  }
}
