import 'package:flutter/material.dart';
import 'package:toy_app/representation/screen/home_page_screen2.dart';
import 'package:toy_app/representation/screen/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate a longer loading time
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Navigate to the next screen after the splash screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePageScreen2(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/image/background1.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                'assets/image/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                'assets/image/splash_logo.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
