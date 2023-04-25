import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toy_app/representation/providers/user_provider.dart';
import 'package:toy_app/representation/screen/home_page_screen2.dart';
import 'package:toy_app/representation/screen/profile/My_profile.dart';
import 'package:toy_app/representation/screen/review_cart/review_cart.dart';
import 'package:toy_app/representation/screen/signin_screen.dart';
import 'package:toy_app/representation/screen/Wish%20List/wishlist.dart';

class DrawerWidget extends StatefulWidget {
  UserProvider userProvider;
  DrawerWidget({
    Key? key,
    required this.userProvider,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
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

  Widget listTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var usersData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: Colors.orange,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 42,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          usersData.userImage ??
                              'https://firebasestorage.googleapis.com/v0/b/toystore-625a1.appspot.com/o/project01%2Ffavpng_user-profile-password-login.png?alt=media&token=c786e220-7556-4cc1-89dc-e752720fe909',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          usersData.userName,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          usersData.userEmail,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 11, fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
                icon: Icons.home_outlined,
                title: 'Home',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const HomePageScreen2()),
                  );
                }),
            listTile(
                icon: Icons.shop_outlined,
                title: 'Review Cart',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                }),
            listTile(
              icon: Icons.person_outlined,
              title: 'My Profile',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(
                      userProvider: widget.userProvider,
                    ),
                  ),
                );
              },
            ),
            listTile(
                icon: Icons.notifications_outlined,
                title: 'Notification',
                onTap: () {}),
            listTile(
                icon: Icons.star_outlined,
                title: 'Rating & Review',
                onTap: () {}),
            listTile(
                icon: Icons.favorite_outlined,
                title: 'Wishlist',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Wishlist(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.copy_outlined,
                title: 'Rise a compaint',
                onTap: () {}),
            listTile(
                icon: Icons.format_quote_outlined, title: 'FAQs', onTap: () {}),
            Container(
              height: 80,
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Contact Support',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Call us:  +(84) 352835100'),
                  Text('Mail us:  nhatan0895@gmail.com')
                ],
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: ListTile(
                    leading: const Icon(
                      Icons.logout_outlined,
                      size: 32,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
