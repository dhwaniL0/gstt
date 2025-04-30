import 'package:flutter/material.dart';
import '../models/invoice.dart';

class InvoiceProvider with ChangeNotifier {
  final List<Invoice> _invoices = [];

  List<Invoice> get invoices => _invoices;

  void addInvoice(Invoice invoice) {
    _invoices.add(invoice);
    notifyListeners();
  }

  void deleteInvoice(int index) {
    _invoices.removeAt(index);
    notifyListeners();
  }
}