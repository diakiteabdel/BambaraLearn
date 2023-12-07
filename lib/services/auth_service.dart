import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<User?> registerWithEmailAndPassword(
      String email, String password, String username, bool photoNow) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user?.updateDisplayName(username);
      User? user = result.user;

      // Enregistrez les informations de l'utilisateur dans Firestore
      await _usersCollection.doc(user?.uid).set({
        'email': email,
        'username': username,
        'photoNow': photoNow,
        // Ajoutez d'autres champs selon vos besoins
      });

      return user;
    } catch (error) {
      print("Erreur lors de l'inscription : $error");
      return null;
    }
  }   

  Future<User?> registerUserWithEmailAndPassword(
    
      String email, String password, String username, String photoNow) async {
    try {
      print("ssssssssssssssssssss");
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user?.updateDisplayName(username);
      User? user = result.user;
      print("==============>${user?.displayName}");

      // Enregistrez les informations de l'utilisateur dans Firestore
      /*await _usersCollection.doc(user?.uid).set({
        'email': email,
        'username': username,
        'photoNow': photoNow,
        // Ajoutez d'autres champs selon vos besoins
      });*/

      return user;
    } catch (error) {
      print("Erreur lors de l'inscription : $error");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
