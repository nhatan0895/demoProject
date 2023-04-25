class Product {
  String? title;
  String? url;
  String? category;
  String? time;
  String? day;
  String? description;

  Product(this.title, this.description, this.category, this.time, this.day,
      this.url);

  static List<Product> products = [
    Product('Coming soon...', 'Coming soon...', 'Coming soon...',
        'Coming soon...', 'Coming soon...', 'assets/images/1.jpg'),
    Product('Coming soon...', 'Coming soon...', 'Coming soon...',
        'Coming soon...', 'Coming soon...', 'assets/images/2.jpg'),
    Product('Coming soon...', 'Coming soon...', 'Coming soon...',
        'Coming soon...', 'Coming soon...', 'assets/images/3.jpg'),
    Product('Coming soon...', 'Coming soon...', 'Coming soon...',
        'Coming soon...', 'Coming soon...', 'assets/images/4.jpg'),
  ];

  static List<Product> movies = [
    Product(
        'LIÊN MINH SIÊU THÚ DC',
        'Hank là chú chó đáng yêu có ước mơ trở thành một samurai vĩ đại. Trên con đường đi tìm định mệnh, Hank vô tình lạc vào một thị trấn đầy mèo. Và mèo thì không hề thích chó. Cũng vì mong muốn giành được tình cảm của cư dân thị trấn, Hank vô tình mắc vào âm mưu thôn tính thị trấn của tay mèo phản diện Ika Chu. Ika Chu đã lừa Hank giúp hắn đuổi các cư dân mèo khỏi thị trấn. Cùng với những người bạn mới quen, Hank phải tìm cách ngăn chặn âm mưu của Ika Chu và chuộc lại sai lầm của mình.',
        'Hoạt Hình',
        '97',
        '01-09-2022',
        'assets/images/a1.jpg'),
    Product(
        'LỜI MỜI ĐẾN ĐỊA NGỤC',
        'Sau khi mẹ qua đời, Evie không còn bất kỳ người thân nào trên đời. Cô quyết định làm xét nghiệm ADN và phát hiện ra mình còn một người em họ đã thất lạc từ lâu. Nhờ vậy mà Evie được gia đình người này mời đến dự một đám cưới xa hoa ở vùng nông thôn nước Anh. Ban đầu, cô có cảm tình với một chàng quý tộc điển trai nhưng nhanh chóng bị đẩy vào cơn ác mộng khi khám phá ra những bí mật đen tối trong lịch sử gia đình mình và âm mưu kinh hoàng đằng sau sự xa hoa của họ.',
        'Kinh Dị',
        '105',
        '26-08-2022',
        'assets/images/a2.jpg'),
    Product(
        'SPIDER MAN: KHÔNG CÒN NHÀ (CHIẾU LẠI)',
        'Lần đầu tiên trong lịch sử điện ảnh của Người Nhện, thân phận người hàng xóm thân thiện bị lật mở, khiến trách nhiệm làm một Siêu Anh Hùng xung đột với cuộc sống bình thường và đặt người anh quan tâm nhất vào tình thế nguy hiểm. Khi anh nhờ đến giúp đỡ của Doctor Strange để khôi phục lại bí mật, phép thuật đã gây ra lỗ hổng thời không, giải phóng những ác nhân mạnh mẽ nhất từng đối đầu với Người Nhện từ mọi vũ trụ. Bây giờ, Peter sẽ phải vượt qua thử thách lớn nhất của mình, nó sẽ thay đổi không chỉ tương lai của chính anh mà còn là tương lai của cả Đa Vũ Trụ.',
        'Hành Động',
        '157',
        '01-09-2022',
        'assets/images/a3.jpg'),
    Product(
        'XA NGOÀI KIA NƠI LOÀI TÔM HÁT',
        'Bộ phim kể về Kya Clark - một cô gái bị gia đình bỏ rơi, lớn lên ở vùng đầm lầy phía nam thị trấn Barkley Cove vào những năm 50. Khi cảnh sát của thị trấn bị phát hiện đã qua đời, người ta bắt đầu dồn mọi mối nghi ngờ vào Kya.',
        'Tình cảm',
        '125',
        '01-09-2022',
        'assets/images/a4.jpg'),
  ];
}
