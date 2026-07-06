import 'package:flutter/material.dart';
import 'package:flutter_mart/providers/cart_provider.dart';
import 'package:flutter_mart/utils/currency_formatter.dart';
import 'package:flutter_mart/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final item = cartProvider.cart;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const AppbarWidget(title: 'Cart'),
      ),
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
                  return Card(
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(8),
                      child: Column(
                        children: [
                          Row(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                item[index].productType.imageUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${item[index].productType.name}'),
                                    const SizedBox(height: 8),
                                    Text('Qty: ${item[index].quantity}'),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<CartProvider>().removeItem(
                                    item[index].productType,
                                  );
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  // 'Rp ${item[index].subtotal.toStringAsFixed(0)}',
                                  formatRupiah(item[index].subtotal),
                                ),
                              ),
                              Row(
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
                                      if (context
                                              .read<CartProvider>()
                                              .decreaseItem(
                                                item[index].productType,
                                              ) ==
                                          true) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Produk dihapus dari keranjang',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    icon: Icon(Icons.remove_outlined),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
