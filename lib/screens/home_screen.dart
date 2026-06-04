import 'package:flutter/material.dart';
import 'package:flutter_mart/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductProvider>().loadProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final product = productProvider.products;
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterMart'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ProductCard(product: product[index]),
                const SizedBox(height: 15),
              ],
            );
          },
        ),
      ), // kamu yang isi
    );
  }
}
