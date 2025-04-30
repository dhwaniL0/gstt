import 'product.dart';

class InvoiceItem {
  final Product product;
  final int quantity;

  InvoiceItem({required this.product, required this.quantity});

  double get totalBase => product.price * quantity;
  double get cgst => totalBase * (product.gstRate / 200);
  double get sgst => totalBase * (product.gstRate / 200);
  double get totalWithGST => totalBase + cgst + sgst;
}

