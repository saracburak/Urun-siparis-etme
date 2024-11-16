import 'package:flutter/material.dart';
import 'package:urun_siparis/account_page.dart';
import 'package:urun_siparis/saved_credit_cards_page.dart';
import 'package:urun_siparis/forward_button.dart';
import 'package:urun_siparis/setting_item.dart';
import 'package:urun_siparis/setting_switch.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkmode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("Profil", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0)
            .copyWith(top: 10.0), // Yalnızca üst padding azaltıldı
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0, // Üst padding azaltılarak yukarıya çekildi
              ),
              child: const Text(
                "Hesabım",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    'images/avatar.png',
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "John Doe",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Spacer(),
                  ForwardButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Ionicons.card,
                    size: 45,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kredi Kartlarım",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ForwardButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SavedCreditCardsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Ayarlar",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: "Dil",
              icon: Ionicons.earth,
              bgColor: Colors.orange.shade100,
              iconColor: Colors.orange,
              value: "Türkçe",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: "Bildirimler",
              icon: Ionicons.notifications,
              bgColor: Colors.blue.shade100,
              iconColor: Colors.blue,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SettingSwitch(
              title: "Koyu Mod",
              icon: Ionicons.moon,
              bgColor: Colors.purple.shade100,
              iconColor: Colors.purple,
              value: isDarkmode,
              onTap: (value) {
                setState(() {
                  isDarkmode = value;
                });
              },
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: "Çıkış Yap",
              icon: Ionicons.exit_outline,
              bgColor: Colors.red.shade100,
              iconColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
