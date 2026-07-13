import 'package:flutter/material.dart';
import 'package:flutter_mart/providers/cart_provider.dart';
import 'package:flutter_mart/screens/cart_screen.dart';
import 'package:flutter_mart/utils/app_colors.dart';
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
    final cartProvider = context.watch<CartProvider>();
    final cart = cartProvider.cart;
    final bool isLoading = productProvider.isLoading;
    final String? errorMessage = productProvider.errorMessage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgMain,
        titleSpacing: 10.0,
        leadingWidth: 65,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 9),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logo/logo.png'),
          ),
        ),
        title: const Text(
          'FlutterMart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 8.0,
        shadowColor: Colors.blueGrey.withValues(alpha: 0.75),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Badge(
              label: Text('${cartProvider.totalItem}'),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : errorMessage != null
            ? Center(child: Text(errorMessage))
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.55,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
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
