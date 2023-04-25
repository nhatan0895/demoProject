import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toy_app/representation/screen/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to sign out the user
  Future<bool> _signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      // Add any additional sign-out logic here
      return true; // sign-out successful
    } catch (e) {
      print(e.toString());
      return false; // sign-out failed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _signOut().then(
            (success) {
              if (success) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SigninScreen(),
                  ),
                );
              } else {
                // handle sign-out failure
              }
            },
          );
        },
        tooltip: 'Sign Out',
        child: const Icon(
          Icons.logout,
          size: 10,
        ),
      ),
    );
  }
}
