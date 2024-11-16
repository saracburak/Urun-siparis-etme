import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';
import 'package:urun_siparis/cart_provider.dart'; // Cart provider'ını import ettik

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(), // Cart provider'ını sağlıyoruz
      child: MaterialApp(
        title: 'Ürün Siparişi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.blue,
            onPrimary: Colors.white,
          ),
          textTheme: TextTheme(
            headlineMedium:
                TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        home:
            const Homepage(), // Homepage widget'ını başlangıç ekranı olarak kullanıyoruz
      ),
    );
  }
}
