import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/invoice_provider.dart';
import '../models/invoice.dart';
import '../models/invoice_item.dart';
import '../models/product.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  final Map<Product, int> selectedItems = {};
  final TextEditingController customerController = TextEditingController();

  void toggleQuantity(Product product, int change) {
    setState(() {
      selectedItems[product] = (selectedItems[product] ?? 0) + change;
      if (selectedItems[product]! <= 0) selectedItems.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final invoiceProvider = Provider.of<InvoiceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Invoice')),
      body: Column(
        children: [
          TextField(controller: customerController, decoration: const InputDecoration(labelText: 'Customer Name')),
          Expanded(
            child: ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('₹${product.price} | GST: ${product.gstRate}%'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () => toggleQuantity(product, -1), icon: const Icon(Icons.remove)),
                      Text('${selectedItems[product] ?? 0}'),
                      IconButton(onPressed: () => toggleQuantity(product, 1), icon: const Icon(Icons.add)),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final customer = customerController.text;
              final items = selectedItems.entries.map((e) => InvoiceItem(product: e.key, quantity: e.value)).toList();
              final invoice = Invoice(customer: customer, date: DateTime.now(), items: items);
              invoiceProvider.addInvoice(invoice);
              selectedItems.clear();
              customerController.clear();
              setState(() {});
            },
            child: const Text('Save Invoice'),
          ),
        ],
      ),
    );
  }
}