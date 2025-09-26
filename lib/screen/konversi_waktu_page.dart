import 'package:flutter/material.dart';

class KonversiWaktuPage extends StatefulWidget {
  const KonversiWaktuPage({super.key});

  @override
  State<KonversiWaktuPage> createState() => _KonversiWaktuPageState();
}

class _KonversiWaktuPageState extends State<KonversiWaktuPage> {
  final TextEditingController _jamController = TextEditingController();
  final TextEditingController _menitController = TextEditingController();

  String? _hasilWita;
  String? _hasilWit;

  void _convertTime() {
    int? jam = int.tryParse(_jamController.text);
    int? menit = int.tryParse(_menitController.text);

    if (jam == null || menit == null) return;

    int jamWita = (jam + 1) % 24;
    if (jamWita < 0) jamWita += 24;

    int jamWit = (jam + 2) % 24;
    if (jamWit < 0) jamWit += 24;

    setState(() {
      _hasilWita =
          "${jamWita.toString().padLeft(2, '0')}:${menit.toString().padLeft(2, '0')} WITA";
      _hasilWit =
          "${jamWit.toString().padLeft(2, '0')}:${menit.toString().padLeft(2, '0')} WIT";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8D6E63),
        foregroundColor: Colors.white,
        title: Text("Konversi Waktu"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _jamController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Jam (WIB)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _menitController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Menit",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _convertTime,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8D6E63),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  "Konversi ke WITA & WIT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_hasilWita != null || _hasilWit != null)
              Column(
                children: [
                  if (_hasilWita != null)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF8D6E63)),
                        borderRadius: BorderRadius.circular(6),
                        color: Color.fromRGBO(141, 110, 99, 0.2),
                      ),
                      child: Text(
                        _hasilWita!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  if (_hasilWit != null)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF8D6E63)),
                        borderRadius: BorderRadius.circular(6),
                        color: Color.fromRGBO(141, 110, 99, 0.2),
                      ),
                      child: Text(
                        _hasilWit!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
