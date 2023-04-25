// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:toy_app/representation/models/product_model.dart';
import 'package:toy_app/representation/widget/singal_item.dart';

class Search extends StatefulWidget {
  const Search({
    Key? key,
    required this.search,
  }) : super(key: key);
  final List<ProductModel> search;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";
  List<ProductModel> searchItem(String query) {
    List<ProductModel> searchSingalProduct = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchSingalProduct;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 52,
            child: TextField(
              onChanged: ((value) {
                setState(() {
                  query = value;
                });
              }),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xffc2c2c2),
                filled: true,
                hintText: 'Search for items in the store',
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: _searchItem.map((data) {
              return SigalItem(
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                isBool: false,
                productId: data.productId,
                productQuantity: 1,
                onDelete: () {},
                wishlist: false,
                productUnit: data,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
