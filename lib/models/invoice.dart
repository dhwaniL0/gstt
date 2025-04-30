import 'invoice_item.dart';

class Invoice {
  int? id;
  String customer;
  DateTime date;
  List<InvoiceItem> items;

  Invoice({this.id, required this.customer, required this.date, required this.items});

  double get totalAmount => items.fold(0, (sum, item) => sum + item.totalWithGST);

  Map<String, dynamic> toMap() => {
        'id': id,
        'customer': customer,
        'date': date.toIso8601String(),
        'items': items.map((e) => {
          'productId': e.product.id,
          'quantity': e.quantity
        }).toList(),
      };
}