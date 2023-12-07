import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bambara_learn/pages/ModifierProfilPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: ProfilPage(),
  ));
}

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        setState(() {
          _user = user;
        });
      } else {
        print('L\'utilisateur n\'est pas connecté');
      }
    } catch (e) {
      print('Erreur lors du chargement des données utilisateur : $e');
    }
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Profil Utilisateur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _selectImage,
                child: CircleAvatar(
                  radius: 35,
                  child: _image == null
                      ? Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.asset(
                            'assets/images/image1.png',
                            fit: BoxFit.contain,
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: Text(
                  _user.displayName ?? 'Nom Utilisateur',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: Text(
                  _user.email ?? 'utilisateur@example.com',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              const StatsZone(),
              const SizedBox(height: 15),
              UserInfosZone(email: _user.email ?? 'utilisateur@example.com'),
              const SizedBox(height: 15),
              Row(children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModifierProfilPage()),
                      );
                    },
                    child: const Text('Modifier le Profil'),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selectImage,
                    child: const Text('Ajouter une photo'),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfosZone extends StatefulWidget {
  const UserInfosZone({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  State<UserInfosZone> createState() => _UserInfosZoneState();
}

class _UserInfosZoneState extends State<UserInfosZone> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        setState(() {
          _user = user;
          // email = user.email! ?? '';
          // username = user.displayName! ?? '';
          // Vous pouvez également récupérer d'autres informations ici
        });
      } else {
        print('L\'utilisateur n\'est pas connecté');
      }
    } catch (e) {
      print('Erreur lors du chargement des données utilisateur : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.lightBlueAccent.shade100,
      color: Colors.transparent,
      elevation: 1.0,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InfoLigne(
              titre: "nom",
              valeur: _user.displayName! ?? 'nom utilisateur',
            ),
            InfoLigne(
              titre: "email",
              valeur: _user.email! ?? 'utilisateur@exemple',
            ),
          ],
        ),
      ),
    );
  }
}

class InfoLigne extends StatelessWidget {
  const InfoLigne({
    Key? key,
    required this.titre,
    required this.valeur,
  }) : super(key: key);

  final String titre;
  final String valeur;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Text(
              titre,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: Text(
                valeur,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatsZone extends StatelessWidget {
  const StatsZone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  disabledForegroundColor: Colors.white,
                  disabledBackgroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.grey.shade500,
                  elevation: 1,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.7, 50),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.light_mode_outlined,
                            color: Colors.deepOrange.shade400,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(2),
                        title: Text(
                          "Score Quiz",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: AutoSizeText(
                          "25 ",
                          presetFontSizes: [14, 13, 12, 11],
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  disabledForegroundColor: Colors.white,
                  disabledBackgroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.grey.shade500,
                  elevation: 1,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.7, 50),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.library_books,
                            color: Colors.green.shade400,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(2),
                        title: Text(
                          "Cours suivis",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: AutoSizeText(
                          "5",
                          presetFontSizes: [14, 13, 12, 11],
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
