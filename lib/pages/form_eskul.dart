import 'package:flutter/material.dart';
import 'package:belajar_flutter/helpers/size_helper.dart';
import 'package:belajar_flutter/pages/output.dart';
import 'package:intl/intl.dart';

class FormEskul extends StatefulWidget {
  const FormEskul({super.key});

  @override
  State<FormEskul> createState() => _FormEskulState();
}

class _FormEskulState extends State<FormEskul> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController tlpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController daftarController = TextEditingController();

  String _eskul = "";
  String? _eskulError;
  String _pilihKelas = "";

  final List<String> kelas = [
    "X RPL 1",
    "X RPL 2",
    "XI RPL 1",
    "XI RPL 2",
    "XII RPL 1",
  ];

  @override
  void initState() {
    daftarController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Formulir Ekstrakurikuler",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Nama';
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        controller: tlpController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "No. Telepon",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input No. Telepon';
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Akun Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Email';
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // Jenis Kelamin
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Jenis Kelamin",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Radio<String>(
                            value: "Badminton",
                            groupValue: _eskul,
                            onChanged: (value) {
                              setState(() {
                                _eskul = value!;
                                _eskulError = null;
                              });
                            },
                          ),
                          Text("Badminton"),
                          SizedBox(width: 24),

                          Radio<String>(
                            value: "Voli",
                            groupValue: _eskul,
                            onChanged: (value) {
                              setState(() {
                                _eskul = value!;
                                _eskulError = null;
                              });
                            },
                          ),
                          Text("Voli"),
                          SizedBox(width: 24),

                          Radio<String>(
                            value: "Futsal",
                            groupValue: _eskul,
                            onChanged: (value) {
                              setState(() {
                                _eskul = value!;
                                _eskulError = null;
                              });
                            },
                          ),
                          Text("Futsal"),
                        ],
                      ),

                      if (_eskulError != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            _eskulError!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),

                      const SizedBox(height: 18),

                      TextFormField(
                        controller: daftarController,
                        decoration: InputDecoration(
                          hintText: "Tanggal Daftar",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Input Tanggal Daftar';
                          }
                          return null;
                        },
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              daftarController.text = DateFormat('yyyy-MM-dd')
                                  .format(pickedDate);
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 18),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Pilih Kelas",
                          border: OutlineInputBorder(),
                        ),
                        items: kelas
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _pilihKelas = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih kelas';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: displayWidth(context) * 0.8,
                        height: displayHeight(context) * 0.075,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _submit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (_eskul.isEmpty) {
      setState(() => _eskulError = 'Pilih Jenis Kelamin');
    }

    if (!isValid || _eskul.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputForm(
          nama: namaController.text,
          eskul: _eskul,
          tglDaftar: daftarController.text,
          kelas: _pilihKelas,
        ),
      ),
    );
  }
}