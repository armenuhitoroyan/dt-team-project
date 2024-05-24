import 'package:flutter/material.dart';
import 'package:chat_messanger_app/pages/homepage/homepage.dart';
import 'package:chat_messanger_app/pages/others/saves.dart';
import 'package:chat_messanger_app/pages/profile/profile.dart';

import 'package:chat_messanger_app/config/colors.dart';

class ViewPager extends StatefulWidget {
  const ViewPager({super.key});

  @override
  State<ViewPager> createState() => _ViewPagerState();
}

class _ViewPagerState extends State<ViewPager> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      _pageController.jumpToPage(_selectedIndex);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const <Widget>[
          Homepage(),
          Saves(),
          // Replace with your Camera page when implemented
          Placeholder(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        showSelectedLabels: true,
        showUnselectedLabels: true,
        useLegacyColorScheme: true,
        unselectedItemColor: AppColors.grey,
        selectedLabelStyle: const TextStyle(color: AppColors.colorSheme),
        unselectedLabelStyle: const TextStyle(color: AppColors.grey),
        enableFeedback: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
