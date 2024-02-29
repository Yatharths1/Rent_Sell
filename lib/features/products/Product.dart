class Product{
  final String user_uid;
  final String item_title;
  final double item_price;
  final String contact_no;
  final String item_category;
  String? item_details;

  Product({
    required this.user_uid,
    required this.item_title,
    required this.item_price,
    required this.contact_no,
    required this.item_category,
    this.item_details,
  });
  
}