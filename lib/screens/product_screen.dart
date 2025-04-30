import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController gstController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Product Management')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('₹${product.price} | GST: ${product.gstRate}%'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => productProvider.deleteProduct(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Product Name')),
                TextField(controller: priceController, decoration: const InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),
                TextField(controller: gstController, decoration: const InputDecoration(labelText: 'GST %'), keyboardType: TextInputType.number),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final price = double.tryParse(priceController.text) ?? 0.0;
                    final gst = double.tryParse(gstController.text) ?? 0.0;
                    productProvider.addProduct(Product(name: name, price: price, gstRate: gst));
                    nameController.clear();
                    priceController.clear();
                    gstController.clear();
                  },
                  child: const Text('Add Product'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}