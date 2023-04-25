// import 'package:flutter/material.dart';
// import 'package:toy_app/representation/data/product.dart';
// import 'package:toy_app/representation/screen/product_overview.dart';

// class KeyChain extends StatefulWidget {
//   KeyChain(this.title, this.keychain, {Key? key}) : super(key: key);
//   String? title;
//   List<Product> keychain;

//   @override
//   State<KeyChain> createState() => KeyChainState();
// }

// class KeyChainState extends State<KeyChain> {
//   String? _size = 'Small';

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(widget.title!,
//                   style: const TextStyle(
//                       fontSize: 17, fontWeight: FontWeight.w600)),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "Tất cả",
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 230,
//             width: double.infinity,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: widget.keychain.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             ProductOverview(product: widget.keychain[index]),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     width: 165,
//                     margin: const EdgeInsets.only(right: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                     widget.keychain[index].productImage),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 5, vertical: 5),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   widget.keychain[index].productName,
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${widget.keychain[index].productPrice}K/ VNĐ',
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Container(
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                               color: Colors.blueGrey),
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                         ),
//                                         child: DropdownButton<String>(
//                                           value: _size,
//                                           underline: const SizedBox
//                                               .shrink(), // default value
//                                           elevation: 16,
//                                           iconSize: 20,
//                                           icon:
//                                               const Icon(Icons.arrow_drop_down),
//                                           style: const TextStyle(
//                                               color: Colors.green),
//                                           onChanged: (String? newValue) {
//                                             setState(() {
//                                               _size = newValue;
//                                             });
//                                           },
//                                           items: <String>['Small', 'Large']
//                                               .map<DropdownMenuItem<String>>(
//                                                   (String value) {
//                                             return DropdownMenuItem<String>(
//                                               value: value,
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                   horizontal: 8,
//                                                 ),
//                                                 child: Text(
//                                                   value,
//                                                   style: const TextStyle(
//                                                       fontSize: 13,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       color: Colors.black),
//                                                 ),
//                                               ),
//                                             );
//                                           }).toList(),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     Expanded(
//                                       child: Container(
//                                         height: 30,
//                                         width: 50,
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                               color: Colors.blueGrey),
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                         ),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Expanded(
//                                               child: IconButton(
//                                                 icon: const Icon(
//                                                     Icons.remove_circle,
//                                                     size: 20,
//                                                     color: Colors.green),
//                                                 onPressed: () {},
//                                               ),
//                                             ),
//                                             const Center(
//                                               child: Text(
//                                                 '1',
//                                                 style: TextStyle(fontSize: 13),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: IconButton(
//                                                 icon: const Icon(
//                                                     Icons.add_circle,
//                                                     size: 20,
//                                                     color: Colors.green),
//                                                 onPressed: () {},
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
