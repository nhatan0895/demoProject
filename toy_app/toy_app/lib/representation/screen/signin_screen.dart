import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/providers/user_provider.dart';
import 'package:toy_app/representation/screen/home_page_screen2.dart';
import 'package:toy_app/representation/screen/splash_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late UserProvider userProvider;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  Future<User?> _googleSignUp() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in ${user?.displayName}");
      userProvider.addUserData(
          currentUser: user,
          userName: user?.displayName,
          userEmail: user?.email,
          userImage: user?.photoURL);
      return user;
    } catch (e) {
      // Handle errors appropriately, e.g. log or display an error message
      // print("Error signing in with Google: $e");
      // Return null explicitly to ensure the function always returns a value

    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image/background.png'),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/image/splash_logo.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Toy Store',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.black,
                        shadows: [
                          BoxShadow(
                            blurRadius: 6,
                            color: Colors.red.shade900,
                            offset: const Offset(4, 3),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          'Sign in to continue',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SignInButton(
                          Buttons.GoogleDark,
                          text: 'Sign up with Google',
                          onPressed: () {
                            _googleSignUp().then(
                              (success) {
                                if (success != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HomePageScreen2(),
                                    ),
                                  );
                                } else {
                                  // handle sign-out failure
                                }
                              },
                            );
                          },
                        ),
                        SignInButton(
                          Buttons.AppleDark,
                          text: 'Sign up with Apple',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'By signing in you are agreeing to our',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SplashScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Terms',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Text(
                        ' and',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SplashScreen()),
                          );
                        },
                        child: const Text(
                          ' Privacy Policy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
