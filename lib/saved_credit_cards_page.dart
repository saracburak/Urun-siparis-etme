import 'package:flutter/material.dart';

// Kredi Kartı Modeli
class CreditCard {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final String cardType; // Visa, MasterCard gibi

  CreditCard({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.cardType,
  });
}

// Kredi Kartı Bileşeni (Widget)
class CreditCardWidget extends StatelessWidget {
  final CreditCard card;

  CreditCardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              card.cardType,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              card.cardNumber,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.cardHolder,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  card.expiryDate,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Kredi Kartları Sayfası
class SavedCreditCardsPage extends StatelessWidget {
  final List<CreditCard> creditCards = [
    CreditCard(
      cardNumber: '**** **** **** 1234',
      cardHolder: 'Ali Veli',
      expiryDate: '12/25',
      cardType: 'Visa',
    ),
    CreditCard(
      cardNumber: '**** **** **** 5678',
      cardHolder: 'Ayşe Yılmaz',
      expiryDate: '11/24',
      cardType: 'MasterCard',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kayıtlı Kredi Kartlarım',
          style: TextStyle(color: Colors.white), // Yazı rengi beyaz
          textAlign: TextAlign.center, // Yazıyı ortala
        ),
        centerTitle: true, // Başlığı ortada göster
        backgroundColor: Colors.blue, // AppBar arka plan rengi mavi
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: creditCards.length,
          itemBuilder: (context, index) {
            return CreditCardWidget(card: creditCards[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Yeni kart ekleme ekranına yönlendirme
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
