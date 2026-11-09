import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // 1. Deklarasikan GlobalKey untuk Form dan variabel penampung data
  final _formKey = GlobalKey<FormState>();  
  String _nama = '';
  DateTime? _selectedDate;

  // 2. Buat fungsi asynchronous untuk memanggil showDatePicker
  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? tanggalPilihan = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2027),
    );

  // Jika pengguna memilih tanggal, perbarui state
  if (tanggalPilihan != null && tanggalPilihan != _selectedDate) {
    setState(() {
      _selectedDate = tanggalPilihan;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Form & Navigasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nama = value!;
                },
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  // Text(
                  //   _selectedDate == null
                  //     : 'Tanggal belum dipilih'
                  //     : 'Tanggal: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                  //   style: const TextStyle(fontSize: 16),
                  // ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => _pilihTanggal(context), 
                    child: const Text('Pilih Tanggal'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tolong pilih tanggal')),
                        );
                        return;
                      }

                      _formKey.currentState!.save();

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Berhasil Disimpan'),
                          content: Text('Nama: $_nama\nTanggal: ${_selectedDate.toString().split(' ')[0]}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Tutup dialog
                                Navigator.pop(context); // Kembali ke halaman sebelumnya (HomeScreen) menggunakan Navigator.pop
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Simpan Data'),
                ), 
              ),
            ],
          ),
        ), 
      ),
    );
  }
}