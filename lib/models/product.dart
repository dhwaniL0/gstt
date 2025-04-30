class Product {
  int? id;
  String name;
  double price;
  double gstRate;

  Product({this.id, required this.name, required this.price, required this.gstRate});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'price': price,
        'gstRate': gstRate,
      };

  factory Product.fromMap(Map<String, dynamic> map) => Product(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        gstRate: map['gstRate'],
      );
}
