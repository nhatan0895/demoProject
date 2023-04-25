// import 'package:flutter/material.dart';
// import 'package:toy_app/representation/data/product.dart';
// import 'package:toy_app/representation/screen/product_overview.dart';
// import 'package:toy_app/representation/screen/search/search.dart';
// import 'package:toy_app/representation/widget/drawer.dart';
// import 'package:toy_app/representation/widget/singal_product.dart';

// class HomePageScreen3 extends StatelessWidget {
//   const HomePageScreen3({Key? key}) : super(key: key);
//   Widget _buildModels(context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text(
//                 'Mô Hình',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 'Tất cả',
//                 style: TextStyle(color: Colors.blueGrey),
//               ),
//             ],
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: Product.models.map((product) {
//               return SingalProduct(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => ProductOverview(
//                         productImage: product.productImage,
//                         productName: product.productName,
//                         productPrice: product.productPrice,
//                         productDescription: product.productDescription,
//                       ),
//                     ),
//                   );
//                 },
//                 productImage: product.productImage,
//                 productName: product.productName,
//                 productPrice: product.productPrice,
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildKeyChain(context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text(
//                 'Móc Khóa',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 'Tất cả',
//                 style: TextStyle(color: Colors.blueGrey),
//               ),
//             ],
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: Product.keychain.map((product) {
//               return SingalProduct(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => ProductOverview(
//                           productImage: product.productImage,
//                           productName: product.productName,
//                           productPrice: product.productPrice,
//                           productDescription: product.productDescription),
//                     ),
//                   );
//                 },
//                 productImage: product.productImage,
//                 productName: product.productName,
//                 productPrice: product.productPrice,
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLego(context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text(
//                 'Lego',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 'Tất cả',
//                 style: TextStyle(color: Colors.blueGrey),
//               ),
//             ],
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: Product.lego.map((product) {
//               return SingalProduct(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => ProductOverview(
//                           productImage: product.productImage,
//                           productName: product.productName,
//                           productPrice: product.productPrice,
//                           productDescription: product.productDescription),
//                     ),
//                   );
//                 },
//                 productImage: product.productImage,
//                 productName: product.productName,
//                 productPrice: product.productPrice,
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(235, 255, 255, 255),
//       drawer: const DrawerWidget(),
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.blueGrey),
//         title: const Center(
//           child: Text(
//             'Toy Store',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//                 color: Colors.white70),
//           ),
//         ),
//         actions: [
//           CircleAvatar(
//             radius: 16,
//             backgroundColor: Colors.orange,
//             child: IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const Search(),
//                   ),
//                 );
//               },
//               icon: const Icon(
//                 Icons.search,
//                 size: 20,
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           const CircleAvatar(
//             radius: 16,
//             backgroundColor: Colors.orange,
//             child: Icon(
//               Icons.shopping_bag,
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 15),
//         ],
//         backgroundColor: Colors.orange,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
//                             padding: const EdgeInsets.only(right: 170),
//                             child: CircleAvatar(
//                               radius: 40,
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.greenAccent,
//                                 radius: 40,
//                                 child: Image.asset(
//                                   'assets/image/logo.png',
//                                   fit: BoxFit.cover,
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
//               _buildModels(context),
//               _buildKeyChain(context),
//               _buildLego(context)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
