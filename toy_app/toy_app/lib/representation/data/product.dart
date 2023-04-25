class Product {
  String productImage;
  String productName;
  String productPrice;
  String productId;
  String productDescription;

  Product(
      {required this.productImage,
      required this.productName,
      required this.productId,
      required this.productDescription,
      required this.productPrice});

  static List<Product> models = [
    Product(
        productId: '1',
        productImage: 'assets/image/sp1.png',
        productName: 'Buzz (Special)',
        productPrice: '650',
        productDescription:
            'Đồ chơi buzz lightyear toy story 4 di động. Có đèn, tiếng và di chuyển được. Hàng nhập từ Mỹ/Anh. Có thể có hàng trễ sau 30 ngày do thông quan lâu'),
    Product(
        productId: '2',
        productImage: 'assets/image/sp2.png',
        productName: 'Woody (Limited)',
        productPrice: '999',
        productDescription:
            'Thương hiệu: Disney Store Chất liệu: Vải - Cao su. Xuất xứ: Thượng Hải. Chiều cao: 40cm. Nói được 30 âm thoại'),
    Product(
        productId: '3',
        productImage: 'assets/image/sp3.png',
        productName: 'Buzz (LightYear)',
        productPrice: '950',
        productDescription:
            'Mô Hình nhân vật BUZZ LIGHTYEAR - cảnh sát vũ trụ trong series TOY STORY. Chính hãng Disney Store. Tỉ lệ 1:1 với nhân vật thật trong phim (cao 30cm). Mô hình cử động các khớp linh hoạt (xem video). Có nút bấm mở cánh, mũ, laze và nói thoại (2 nút)'),
  ];
  static List<Product> lego = [
    Product(
        productId: '1',
        productImage: 'assets/image/lg1.png',
        productName: 'Buzz khá bảnh',
        productPrice: '150',
        productDescription:
            'Bộ đồ chơi lắp ráp kiểu Lego ToysStory Buzz LightYear SX phi hành gia Buzz model 9060. ➡ Model: 9060. ➡ Số chi tiết: 243 chi tiết. ➡ Kích thước hộp: 25x38x5.5 cm. ➡ Tiêu chuẩn chất lượng: 3C, EN71, ASTM, HR4040 . - Các miếng ghép được thiết kế tinh xảo, màu sắc đẹp mắt và vô cùng an toàn với các bé!. - Chất liệu nhựa cũng có độ cứng bền cao, khó bị nứt vỡ hay biến dạng dưới tác động của va đập.  - Thiết kế đẹp mắt, gọn gàng.  - Màu sắc tươi sáng, sinh động càng tạo nên cảm hứng cho trẻ nhỏ khi chơi. Sau khi chơi xong, mô hình có thể bỏ lại trong hộp và cất giữ gọn gàng'),
    Product(
        productId: '2',
        productImage: 'assets/image/lg2.png',
        productName: 'Woody và đồng bọn',
        productPrice: '299',
        productDescription:
            'Set đồ chơi lego Toy Story bao gồm các nhân vật quen thuộc với các bạn nhỏ như cao bồi Woody, Buzz Lighting , với chất liệu nhựa được lắp ghép thành món đồ chơi hay còn có thể làm đồ vật trang trí trong ngôi nhà của chúng ta'),
    Product(
        productId: '3',
        productImage: 'assets/image/lg3.png',
        productName: 'Buzz & Woody (Special)',
        productPrice: '485',
        productDescription:
            'Thời gian giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày.  Đồ chơi búp bê nhung lông mềm hình hoạt hình Câu chuyện đồ chơi Disney 50cm Woody Buzz Lightyear món quà cho trẻ em. Đặc trưng:. 100% hàng mới chất lượng cao. Tình trạng: Mới, chưa bao giờ sử dụng. Chất liệu: cotton PP. Kích thước: khoảng 30-50cm'),
  ];
  static List<Product> keychain = [
    Product(
        productId: '1',
        productImage: 'assets/image/k1.png',
        productName: 'Bộ 3 nguyên tử',
        productPrice: '150',
        productDescription:
            'Cách sử dụng: Trang trí bàn làm việc, trưng bày, sưu tập quà tặng sinh nhật, quà tặng người yêu, quà tặng cho bé đi học, quà tặng học sinh, phụ kiện ô tô, phụ kiện xe máy, phụ kiện túi xách giỏ, cặp học sinh, phụ kiện xe đạp, chìa khóa xe, quà giáng sinh'),
    Product(
        productId: '2',
        productImage: 'assets/image/k2.png',
        productName: 'Woody tinh nghịch',
        productPrice: '40',
        productDescription:
            'Chất liệu: Silicon. Phù hợp với: Túi, Chìa khóa, trang trí, quà tặng.  Nhân dịp: Hàng ngày, Sinh nhật, Đám cưới, Kỷ niệm, Ngày Valene, Ngày của mẹ, Giáng sinh'),
    Product(
        productId: '3',
        productImage: 'assets/image/k3.png',
        productName: 'Quái vật 3 mắt',
        productPrice: '69',
        productDescription:
            'Thương hiệu mới và chất lượng cao!!!. ☞☞☞Thông tin sản phẩm☜☜☜. Chất liệu: Vải lông. Chất liệu làm đầy: Bông. Màu sắc: như hình. Kích thước: khoảng 11cm. Mô hình: Lotso'),
  ];
}
