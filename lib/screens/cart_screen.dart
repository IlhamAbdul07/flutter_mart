import 'package:flutter/material.dart';
import 'package:flutter_mart/providers/cart_provider.dart';
import 'package:flutter_mart/utils/currency_formatter.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final item = cartProvider.cart;

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: cartProvider.cart.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text('Keranjang kamu masih kosong'),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                          item[index].productType.imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          '${item[index].productType.name} x ${item[index].quantity}',
                        ),
                        subtitle: Text(
                          // 'Rp ${item[index].subtotal.toStringAsFixed(0)}',
                          formatRupiah(item[index].subtotal),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<CartProvider>().removeItem(
                              item[index].productType,
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<CartProvider>().addItem(
                                item[index].productType,
                              );
                            },
                            icon: Icon(Icons.add_outlined),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<CartProvider>().decreaseItem(
                                item[index].productType,
                              );
                            },
                            icon: Icon(Icons.remove_outlined),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  );
                },
              ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formatRupiah(cartProvider.totalPrice)),
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
