class DeliveryAddressModel {
  String fullName;
  String numberNo;
  String anotherNumberNo;
  String street;
  String district;
  String city;
  String addressTypes;

  DeliveryAddressModel(
      {required this.addressTypes,
      required this.fullName,
      required this.numberNo,
      required this.anotherNumberNo,
      required this.street,
      required this.district,
      required this.city});
}
