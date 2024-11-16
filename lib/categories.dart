import 'package:flutter/material.dart';
import 'hamburger_page.dart'; // Yeni sayfayı import et
import 'tost_page.dart'; // Tost sayfası
import 'drink_page.dart'; // İçecekler sayfası
import 'sandwich_page.dart'; // Sandwich sayfası
import 'atistirmalik_page.dart'; // Atıştırmalık sayfası
import 'naneli_sekerler_page.dart'; // Naneli şekerler sayfası

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Ürünler', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // İki sütun
            crossAxisSpacing: 8.0, // Sütunlar arası boşluk
            mainAxisSpacing: 8.0, // Satırlar arası boşluk
            childAspectRatio: 1.0, // Kartların en-boy oranı
          ),
          children: <Widget>[
            _buildProductCard(
                'Hamburger', 'images/hamburger.png', context, HamburgerPage()),
            _buildProductCard('Tost', 'images/tost.jpg', context, TostPage()),
            _buildProductCard(
                'İçecekler', 'images/icecekler.jpg', context, DrinkPage()),
            _buildProductCard(
                'Sandwich', 'images/sandwich.jpg', context, SandwichPage()),
            _buildProductCard('Atıştırmalık', 'images/kraker.png', context,
                AtistirmalikPage()),
            _buildProductCard('Naneli Şekerler', 'images/mentos.png', context,
                NaneliSekerlerPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      String title, String imagePath, BuildContext context, Widget? page) {
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
