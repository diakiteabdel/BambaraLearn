import 'package:bambara_learn/pages/GeneralPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'accueil_page.dart';

class InitializationPage extends StatefulWidget {
  const InitializationPage({Key? key}) : super(key: key);

  @override
  State<InitializationPage> createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> verifierDejaOuverte() async {
    final SharedPreferences prefs = await _prefs;
    await Future.delayed(const Duration(seconds: 5));
    return prefs.getBool("dejaOuverte") ?? false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //open = Initialize.isOpen() as bool;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud PractoQuiz',
      theme: ThemeData(
        primaryColor: Colors.white,
        //primarySwatch: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: verifierDejaOuverte(),
        builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.done) {
            print("retour ${snapshot.hasData}");
            if (snapshot.data == true) {
              print("yes");
              return const GeneralPage();
            } else {
              print("no");
              return const Scaffold();
            }
          } else {
            return const SplashScreen();
          } 
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Center(
                child: ClipOval(
                  child: Image(image: AssetImage('assets/images/Logo.jpg'),
                  width: 200,
                  height: 200,
                  //fit: BoxFit.cover,
                  ),
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: Text(
                  "Explorez la richesse du MALI avec Bambaralearn.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 10,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ), 
            
            /*CircularProgressIndicator(
            color: Colors.green,
          ),*/
          ],
        ),
        floatingActionButton: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
