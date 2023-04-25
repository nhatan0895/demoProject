// import 'package:flutter/material.dart';
// import 'package:toy_app/representation/data/product.dart';
// import 'package:toy_app/representation/widget/drawer.dart';
// import 'package:toy_app/representation/widget/keychain.dart';
// import 'package:toy_app/representation/widget/lego.dart';
// import 'package:toy_app/representation/widget/model.dart';

// class HomePageScreen extends StatelessWidget {
//   const HomePageScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(225, 255, 255, 255),
//       drawer: const DrawerWidget(),
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: const Center(
//           child: Text(
//             'Toy Store',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//           ),
//         ),
//         actions: const [
//           CircleAvatar(
//             radius: 14,
//             backgroundColor: Colors.black,
//             child: Icon(
//               Icons.search,
//               size: 17,
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           CircleAvatar(
//             radius: 14,
//             backgroundColor: Colors.black,
//             child: Icon(
//               Icons.shopping_bag,
//               size: 17,
//             ),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//         ],
//         backgroundColor: Colors.orangeAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 150,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/image/background_home.png'),
//                     fit: BoxFit.cover,
//                     opacity: 0.9,
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 185),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.greenAccent,
//                               radius: 30,
//                               child: SizedBox(
//                                 width: 45.0,
//                                 height: 45.0,
//                                 child: Image.asset(
//                                   'assets/image/logo.png',
//                                   fit: BoxFit.contain,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const Text(
//                             '50% OFF',
//                             style: TextStyle(
//                               fontSize: 40,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               shadows: [
//                                 BoxShadow(
//                                   blurRadius: 6,
//                                   color: Colors.black,
//                                   offset: Offset(5, 4),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Text(
//                             'on all children toys',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                               shadows: [
//                                 BoxShadow(
//                                   blurRadius: 6,
//                                   color: Colors.black,
//                                   offset: Offset(5, 4),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Column(
//                   children: [
//                     Model("Mô Hình", Product.models),
//                     Lego("Lego", Product.lego),
//                     KeyChain("Móc Khóa", Product.keychain),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
