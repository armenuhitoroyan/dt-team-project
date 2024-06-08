import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/pages/homepage/homepage.dart';
import 'package:chat_messanger_app/pages/others/saves.dart';
import 'package:chat_messanger_app/pages/profile/profile.dart';
import 'package:chat_messanger_app/pages/scan/camera.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    const Homepage(),
    const Saves(),
    const Camera(), // Replace this with your Camera page
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.colorSheme,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        useLegacyColorScheme: true,
        unselectedItemColor: AppColors.grey,
        selectedLabelStyle: const TextStyle(color: AppColors.colorSheme),
        unselectedLabelStyle: const TextStyle(color: AppColors.grey),
        enableFeedback: true,
        onTap: _onItemTapped,
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
      ),
    );
  }
}
