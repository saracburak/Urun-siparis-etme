import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:provider/provider.dart';
import 'package:urun_siparis/cart_provider.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Hamburgerler', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          _buildDrinkItem(context, 'Su', 'images/icecekler.jpg', 10),
          _buildDrinkItem(context, 'Kola', 'images/icecekler.jpg', 15),
          _buildDrinkItem(context, 'Ayran', 'images/icecekler.jpg', 15),
          _buildDrinkItem(context, 'Fanta', 'images/icecekler.jpg', 15),
          _buildDrinkItem(context, 'Gazoz', 'images/icecekler.jpg', 15),
          _buildDrinkItem(context, 'Soda', 'images/icecekler.jpg', 15),
        ],
      ),
    );
  }

  Widget _buildDrinkItem(
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
