import 'package:flutter/material.dart';
import 'package:urun_siparis/account_item.dart';
import 'package:ionicons/ionicons.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String cinsiyet = "man";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: Size(50, 50),
              ),
              icon: Icon(
                Ionicons.checkmark,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hesabım",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              AccountItem(
                title: "Resim",
                widget: Column(
                  children: [
                    Image.asset(
                      'images/avatar.png',
                      height: 100,
                      width: 100,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.lightBlueAccent,
                      ),
                      child: const Text("Resim Yükle"),
                    )
                  ],
                ),
              ),
              const AccountItem(
                title: "Ad",
                widget: TextField(),
              ),
              const SizedBox(height: 40),
              const AccountItem(
                title: "Soyad",
                widget: TextField(),
              ),
              const SizedBox(height: 40),
              AccountItem(
                title: "Cinsiyet",
                widget: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          cinsiyet = "man";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: cinsiyet == "man"
                            ? Colors.blue
                            : Colors.grey.shade300,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Ionicons.man,
                        color: cinsiyet == "man" ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          cinsiyet = "woman";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: cinsiyet == "woman"
                            ? Colors.pink.shade300
                            : Colors.grey.shade300,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Ionicons.woman,
                        color:
                            cinsiyet == "woman" ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const AccountItem(
                widget: TextField(),
                title: "Okul No",
              ),
              const SizedBox(height: 40),
              const AccountItem(
                widget: TextField(),
                title: "Sınıf",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
