import 'package:flutter/material.dart';
import 'providers/product_provider.dart';
import 'providers/invoice_provider.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => InvoiceProvider()),
      ],
      child: MaterialApp(
        title: 'GST Billing App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}