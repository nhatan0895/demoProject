import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/Login.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.black,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/b.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const Text(
                      'Chào bạn',
                      style: TextStyle(fontSize: 20, color: Colors.redAccent),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user.email!,
                      style: const TextStyle(color: Colors.lightBlue),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.account_box, color: Colors.white),
                  title: Text(
                    'Thông tin tài khoản',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.handshake, color: Colors.white),
                  title: Text(
                    'Liên kết tài khoản ngân hàng',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.card_giftcard, color: Colors.white),
                  title: Text(
                    'Tích điểm',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.history, color: Colors.white),
                  title: Text(
                    'Lịch sử đặt vé',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.white),
                  title: const Text(
                    'Đăng xuất',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const Login()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
