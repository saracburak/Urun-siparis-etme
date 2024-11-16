import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardHolderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'Ödeme Sayfası',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Kart Numarası
                    _buildTextFormField(
                      controller: _cardNumberController,
                      label: 'Kart Numarası',
                      hint: '1234 5678 9012 3456',
                      icon: Icons.credit_card,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        _CardNumberFormatter(),
                      ],
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 16) {
                          return 'Geçerli bir kart numarası girin';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16.0),

                    // Son Kullanma Tarihi
                    _buildTextFormField(
                      controller: _expiryDateController,
                      label: 'Son Kullanma Tarihi',
                      hint: 'MM/YY',
                      icon: Icons.date_range,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        _ExpiryDateFormatter(),
                      ],
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 5) {
                          return 'Geçerli bir tarih girin';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16.0),

                    // CVV
                    _buildTextFormField(
                      controller: _cvvController,
                      label: 'CVV',
                      hint: '123',
                      icon: Icons.lock,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 3) {
                          return 'Geçerli bir CVV girin';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16.0),

                    // Kart Sahibinin Adı
                    _buildTextFormField(
                      controller: _cardHolderController,
                      label: 'Kart Sahibinin Adı',
                      hint: 'John',
                      icon: Icons.person,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kart sahibinin adını girin';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30.0),

                    // Satın Al Butonu
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Ödeme Başarıyla Tamamlandı!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            // Ödeme işlemi burada tetiklenebilir
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          textStyle: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                        child: const Text('Satın Al',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required TextInputType keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.indigo),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
    );
  }
}

// Özel kart numarası formatlayıcı (1234 5678 9012 3456 şeklinde ayırır)
class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.replaceAll(' ', '');
    final formattedText = newText.replaceAllMapped(
        RegExp(r".{1,4}"), (match) => "${match.group(0)} ");
    return TextEditingValue(
      text: formattedText.trim(),
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

// Özel son kullanma tarihi formatlayıcı (MM/YY şeklinde ayırır)
class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.replaceAll('/', '');
    String formattedText = '';
    if (newText.length >= 2) {
      formattedText = newText.substring(0, 2) + '/' + newText.substring(2);
    } else {
      formattedText = newText;
    }
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
