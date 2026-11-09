import 'package:flutter/material.dart';

class OutputForm extends StatelessWidget {
  final String nama, email, telp, tglDaftar, kelas;
  final List<String> eskul;

  OutputForm({
    Key? key,
    required this.nama,
    required this.eskul,
    required this.email,
    required this.telp,
    required this.tglDaftar,
    required this.kelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), 
            side: BorderSide(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textWidget("Nama", nama),
                _textWidget("Email", email),
                _textWidget("Telepon", telp),
                _textWidget("Kelas", kelas),
                _textWidget("Ekskul", eskul.join(", ")),
                _textWidget("Tanggal Daftar", tglDaftar),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(": $value")),
        ],
      ),
    );
  }
}