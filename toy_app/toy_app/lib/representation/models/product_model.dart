class ProductModel {
  String productImage;
  String productName;
  int productPrice;
  String productDescription;
  String productId;
  int productQuantity;
  List<dynamic> productUnit;
  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productId,
    required this.productUnit,
    required this.productQuantity,
  });
}
