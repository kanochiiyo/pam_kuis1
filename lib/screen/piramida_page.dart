import 'package:flutter/material.dart';

class PiramidaPage extends StatefulWidget {
  const PiramidaPage({super.key});

  @override
  State<PiramidaPage> createState() => _PiramidaPageState();
}

class _PiramidaPageState extends State<PiramidaPage> {
  final TextEditingController _sisiController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  double? _volume;
  double? _keliling;

  void _hitung() {
    final double? s = double.tryParse(_sisiController.text);
    final double? t = double.tryParse(_tinggiController.text);

    if (s != null && t != null) {
      setState(() {
        _volume = (s * s * t) / 3;
        _keliling = 4 * s;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8D6E63),
        foregroundColor: Colors.white,
        title: Text("Menu Piramida"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Sisi alas (cm)",
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
            SizedBox(height: 12),

            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tinggi piramida (cm)",
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
                onPressed: _hitung,
                child: Text("Tentukan", style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 20),

            if (_volume != null && _keliling != null)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(141, 110, 99, 0.2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Color(0xFF8D6E63)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Volume: ${_volume!.toStringAsFixed(2)} cm^3",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Keliling alas: ${_keliling!.toStringAsFixed(2)} cm",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
