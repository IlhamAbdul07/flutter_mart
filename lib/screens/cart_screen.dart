import 'package:flutter/material.dart';
import 'package:flutter_mart/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final item = cartProvider.cart;

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja')),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                // leading: Image.network(src),
                title: Text(
                  '${item[index].productType.name} x ${item[index].quantity}',
                ),
                subtitle: Text('Rp ${item[index].subtotal.toStringAsFixed(0)}'),
                trailing: IconButton(
                  onPressed: () {
                    context.read<CartProvider>().removeItem(
                      item[index].productType,
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
              const SizedBox(height: 15),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Rp ${cartProvider.totalPrice.toStringAsFixed(0)}'),
            TextButton(
              onPressed: () {},
              child: const Text('Lanjutkan Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }
}
