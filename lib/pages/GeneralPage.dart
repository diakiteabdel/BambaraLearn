import 'package:bambara_learn/pages/CulturalRessourcePage.dart';
import 'package:bambara_learn/pages/DictionaryPage.dart';
import 'package:bambara_learn/pages/ProfilPage.dart';
import 'package:bambara_learn/pages/accueil_page.dart';
import 'package:bambara_learn/pages/historyPage.dart';
import 'package:bambara_learn/pages/initial.page.dart';
import 'package:flutter/material.dart';


class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
 int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
   AccueilPage(),
    HistoryPage(),
    DictionaryPage(),
    CulturalRessourcePage(),
    ProfilPage(),
  //  InitializationPage()

  ];
  // @override
  // Widget build(BuildContext context) {
  //   return   Scaffold(
   

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      //appBar: AppBar(
      //  title: const Text('BottomNavigationBar Sample'),
      //),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Dictionary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.museum_outlined),
            label: 'Cultural\nRessource',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }


}