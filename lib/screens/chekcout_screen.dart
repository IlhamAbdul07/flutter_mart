import 'package:flutter/material.dart';
import 'package:flutter_mart/providers/cart_provider.dart';
import 'package:flutter_mart/providers/checkout_provider.dart';
import 'package:flutter_mart/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _promoController = TextEditingController();
  TextEditingController _paymentMethodController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _promoController.dispose();
    _paymentMethodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkoutProvider = context.read<CheckoutProvider>();
    final cartProvider = context.read<CartProvider>();
    final item = cartProvider.cart;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppbarWidget(title: "Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            ...item
                .map(
                  (cartItem) => ListTile(
                    title: Text(cartItem.productType.name),
                    subtitle: Text('Qty: ${cartItem.quantity}'),
                  ),
                )
                .toList(),
            const SizedBox(height: 18),
            TextField(
              controller: _nameController,
              onChanged: (value) => checkoutProvider.setField("name", value),
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _addressController,
              onChanged: (value) => checkoutProvider.setField("address", value),
              decoration: const InputDecoration(labelText: "Address"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              onChanged: (value) => checkoutProvider.setField("phone", value),
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _promoController,
              onChanged: (value) => checkoutProvider.setField("promo", value),
              decoration: const InputDecoration(labelText: "Promo Code"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _paymentMethodController,
              onChanged: (value) =>
                  checkoutProvider.setField("paymentMethod", value),
              decoration: const InputDecoration(labelText: "Payment Method"),
            ),
          ],
        ),
      ),
    );
  }
}
