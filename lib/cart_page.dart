import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_siparis/cart_provider.dart';
import 'payment_page.dart'; // Ödeme sayfasını import ettik

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Sepet", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Sepet boş',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, index) {
                final item = cartItems[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text('${item.price}₺'),
                        ),
                      ),
                    ),
                    title: Text(item.title),
                    subtitle: Text(
                        'Toplam: ${(item.price * item.quantity).toStringAsFixed(2)}₺'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            cart.removeSinlgeItem(
                                item.id); // Ürünü azaltma işlemi
                          },
                        ),
                        Text('${item.quantity}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            cart.addItem(item.id, item.price,
                                item.title); // Ürünü artırma işlemi
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            cart.removeItem(item.id); // Ürünü sepetten çıkarma
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10), // Kenarlara olan mesafe
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Boşlukların minimize edilmesini sağlar
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Toplam',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 50),
                Chip(
                  label: Text(
                    '${cart.totalAmount.toStringAsFixed(2)}₺',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                  side: BorderSide.none,
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const PaymentPage(), // Ödeme sayfasına yönlendirme
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Satın Al'),
                ),
              ],
            ),
            const SizedBox(height: 30), // Alt kısım px boşluk ayarlama
          ],
        ),
      ),
    );
  }
}
