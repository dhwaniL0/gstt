import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/invoice_provider.dart';

class InvoiceHistoryScreen extends StatelessWidget {
  const InvoiceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Invoice History')),
      body: ListView.builder(
        itemCount: invoiceProvider.invoices.length,
        itemBuilder: (context, index) {
          final invoice = invoiceProvider.invoices[index];
          return ListTile(
            title: Text(invoice.customer),
            subtitle: Text('₹${invoice.totalAmount.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => invoiceProvider.deleteInvoice(index),
            ),
          );
        },
      ),
    );
  }
}
