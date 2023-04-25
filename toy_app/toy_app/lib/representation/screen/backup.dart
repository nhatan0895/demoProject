// import 'package:flutter/material.dart';
// import 'package:toy_app/representation/widget/drawer.dart';

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
//         child: Column(
//           children: [
//             Container(
//               height: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: const DecorationImage(
//                   image: AssetImage('assets/image/background_home.png'),
//                   fit: BoxFit.cover,
//                   opacity: 0.9,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: 185),
//                           child: CircleAvatar(
//                             backgroundColor: Colors.greenAccent,
//                             radius: 30,
//                             child: SizedBox(
//                               width: 45.0,
//                               height: 45.0,
//                               child: Image.asset(
//                                 'assets/image/logo.png',
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Text(
//                           '50% OFF',
//                           style: TextStyle(
//                             fontSize: 40,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             shadows: [
//                               BoxShadow(
//                                 blurRadius: 6,
//                                 color: Colors.black,
//                                 offset: Offset(5, 4),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Text(
//                           'on all children toys',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                             shadows: [
//                               BoxShadow(
//                                 blurRadius: 6,
//                                 color: Colors.black,
//                                 offset: Offset(5, 4),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text(
//                     'Mô hình',
//                     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//                   ),
//                   Text(
//                     'View all',
//                     style: TextStyle(color: Colors.blueGrey),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 Container(
//                   height: 230,
//                   width: 165,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: const DecorationImage(
//                               image: AssetImage('assets/image/sp1.png'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 5, vertical: 5),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Buzz (Special)',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               const Text(
//                                 '500k/VNĐ ',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       padding: EdgeInsets.only(left: 4),
//                                       height: 30,
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                         border:
//                                             Border.all(color: Colors.blueGrey),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Row(
//                                         children: const [
//                                           Expanded(
//                                               child: Text(
//                                             'Small',
//                                             style: TextStyle(fontSize: 13),
//                                           )),
//                                           Expanded(
//                                             child: Icon(Icons.arrow_drop_down,
//                                                 size: 20, color: Colors.green),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       height: 30,
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                         border:
//                                             Border.all(color: Colors.blueGrey),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Row(
//                                         children: const [
//                                           Expanded(
//                                             child: Icon(Icons.remove_circle,
//                                                 size: 20, color: Colors.green),
//                                           ),
//                                           Center(
//                                             child: Text(
//                                               '1',
//                                               style: TextStyle(fontSize: 13),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Icon(Icons.add_circle,
//                                                 size: 20, color: Colors.green),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
