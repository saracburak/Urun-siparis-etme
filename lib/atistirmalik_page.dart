import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:provider/provider.dart';
import 'package:urun_siparis/cart_provider.dart';

class AtistirmalikPage extends StatelessWidget {
  const AtistirmalikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Atıştırmalıklar', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          _buildBurgerItem(context, 'Bisküvi', 'images/kraker.png', 10),
          _buildBurgerItem(context, 'Çikolata', 'images/kraker.png', 12),
          _buildBurgerItem(context, 'Cips', 'images/kraker.png', 10),
        ],
      ),
    );
  }

  Widget _buildBurgerItem(
      BuildContext context, String title, String imagePath, double price) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      title: Text(title),
      subtitle: Text('Fiyat: $price ₺'),
      trailing: ElevatedButton(
        onPressed: () {
          // Sepete ürün ekleme işlemi
          Provider.of<Cart>(context, listen: false).addItem(
            title, // ID olarak kullanmak için başlık
            price,
            title,
          );
          // Bildirim gösterme
          Flushbar(
            message: '$title Sepete Eklendi',
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
            messageText: Text(
              '$title Sepete Eklendi',
              style: TextStyle(color: Colors.white),
            ),
          ).show(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // Butonun arka plan rengi
          foregroundColor: Colors.white, // Buton yazısının rengi
        ),
        child: Text('Sepete Ekle'),
      ),
    );
  }
}
