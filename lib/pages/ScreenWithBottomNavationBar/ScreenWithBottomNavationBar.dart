import 'package:bambara_learn/pages/CulturalRessourcePage.dart';
import 'package:bambara_learn/pages/DictionaryPage.dart';
import 'package:bambara_learn/pages/Homepage.dart';
import 'package:bambara_learn/pages/ProfilPage.dart';
import 'package:bambara_learn/pages/historyPage.dart';
import 'package:flutter/material.dart';

class ScreenWithBottomNav extends StatefulWidget {
  const ScreenWithBottomNav({Key? key}) : super(key: key);

  @override
  State<ScreenWithBottomNav> createState() => _BottomNavigState();
}

class _BottomNavigState extends State<ScreenWithBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const DictionaryPage(),
    const HistoryPage(),
    const CulturalRessourcePage(),
    const ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Dictionary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Cultural Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
