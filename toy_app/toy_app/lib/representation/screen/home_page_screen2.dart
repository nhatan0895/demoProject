import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/providers/product_provider.dart';
import 'package:toy_app/representation/providers/user_provider.dart';
import 'package:toy_app/representation/screen/product_overview.dart';
import 'package:toy_app/representation/screen/review_cart/review_cart.dart';
import 'package:toy_app/representation/screen/search/search.dart';
import 'package:toy_app/representation/widget/drawer.dart';
import 'package:toy_app/representation/widget/singal_product.dart';

class HomePageScreen2 extends StatefulWidget {
  const HomePageScreen2({Key? key}) : super(key: key);

  @override
  State<HomePageScreen2> createState() => _HomePageScreen2State();
}

class _HomePageScreen2State extends State<HomePageScreen2> {
  late ProductProvider productProvider;
  Widget _buildModels(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mô Hình',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                          search: productProvider.getmodelsProductDataList),
                    ),
                  );
                },
                child: const Text(
                  'Tất cả',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getmodelsProductDataList
                .map<Widget>((modelsProductData) {
              return SingalProduct(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage: modelsProductData.productImage,
                        productName: modelsProductData.productName,
                        productPrice: modelsProductData.productPrice,
                        productDescription:
                            modelsProductData.productDescription,
                        productId: modelsProductData.productId,
                        productUnit: modelsProductData,
                      ),
                    ),
                  );
                },
                productImage: modelsProductData.productImage,
                productName: modelsProductData.productName,
                productPrice: modelsProductData.productPrice,
                productId: modelsProductData.productId,
                productUnit: modelsProductData,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildKeyChain(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Móc Khóa',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                          search: productProvider.getkeychainProductDataList),
                    ),
                  );
                },
                child: const Text(
                  'Tất cả',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getkeychainProductDataList
                .map<Widget>((keychainProductData) {
              return SingalProduct(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage: keychainProductData.productImage,
                        productName: keychainProductData.productName,
                        productPrice: keychainProductData.productPrice,
                        productDescription:
                            keychainProductData.productDescription,
                        productId: keychainProductData.productId,
                        productUnit: keychainProductData,
                      ),
                    ),
                  );
                },
                productImage: keychainProductData.productImage,
                productName: keychainProductData.productName,
                productPrice: keychainProductData.productPrice,
                productId: keychainProductData.productId,
                productUnit: keychainProductData,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildLego(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Lego',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                          search: productProvider.getlegoProductDataList),
                    ),
                  );
                },
                child: const Text(
                  'Tất cả',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getlegoProductDataList
                .map<Widget>((legoProductData) {
              return SingalProduct(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage: legoProductData.productImage,
                        productName: legoProductData.productName,
                        productPrice: legoProductData.productPrice,
                        productDescription: legoProductData.productDescription,
                        productId: legoProductData.productId,
                        productUnit: legoProductData,
                      ),
                    ),
                  );
                },
                productImage: legoProductData.productImage,
                productName: legoProductData.productName,
                productPrice: legoProductData.productPrice,
                productId: legoProductData.productId,
                productUnit: legoProductData,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider initproductProvider = Provider.of(context, listen: false);
    initproductProvider.fatchmodelsProductData();
    initproductProvider.fatchkeychainProductData();
    initproductProvider.fatchlegoProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 255, 255, 255),
      drawer: DrawerWidget(userProvider: userProvider),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.red),
        title: const Center(
          child: Text(
            'Toy Store',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white70),
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.orange,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Search(
                      search: productProvider.getAllProductSearch,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.orange,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_bag,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/image/background_home.png'),
                    fit: BoxFit.cover,
                    opacity: 0.9,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 170),
                            child: CircleAvatar(
                              radius: 40,
                              child: CircleAvatar(
                                backgroundColor: Colors.greenAccent,
                                radius: 40,
                                child: Image.asset(
                                  'assets/image/logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            '50% OFF',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 6,
                                  color: Colors.black,
                                  offset: Offset(5, 4),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'on all children toys',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 6,
                                  color: Colors.black,
                                  offset: Offset(5, 4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              _buildModels(context),
              _buildKeyChain(context),
              _buildLego(context)
            ],
          ),
        ),
      ),
    );
  }
}
