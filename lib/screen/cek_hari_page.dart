import 'package:flutter/material.dart';

class CekHariPage extends StatefulWidget {
  const CekHariPage({super.key});

  @override
  State<CekHariPage> createState() => _CekHariPageState();
}

class _CekHariPageState extends State<CekHariPage> {
  final TextEditingController _angkaInput = TextEditingController();
  String? _hasil;

  void _cekHari() {
    int? angkaHari = int.tryParse(
      _angkaInput.text,
    ); // ambil input dari TextField

    List<String> hari = [
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
      "Minggu",
    ];

    if (angkaHari != null && (angkaHari >= 1 && angkaHari <= 7)) {
      setState(() {
        _hasil = hari[angkaHari - 1];
      });
    } else {
      setState(() {
        _hasil = "Angka tidak valid";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8D6E63),
        foregroundColor: Colors.white,
        title: Text("Cek Hari"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _angkaInput,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan angka 1-7",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Color(0xFF8D6E63)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Color(0xFF8D6E63), width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8D6E63),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: _cekHari,
                child: Text("Tentukan", style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 20),
            if (_hasil != null)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(141, 110, 99, 0.2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Color(0xFF8D6E63)),
                ),
                child: Text(
                  "Hari: $_hasil",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
