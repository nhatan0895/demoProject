import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/Login.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    margin: const EdgeInsets.only(top: 30, bottom: 10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/b.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    user.email!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Thông tin cá nhân',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.place),
            title: Text(
              'Rạp',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.wallet_membership_sharp),
            title: Text(
              'Thành viên',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Cài đặt',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              'Đăng xuất',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const Login()));
            },
          ),
        ],
      ),
    );
  }
}
