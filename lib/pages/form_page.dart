import 'package:flutter/material.dart';

class Formpage extends StatefulWidget {
  const Formpage({super.key});

  @override
  State<Formpage> createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  // kunci global form
  final _formKey = GlobalKey<FormState>();

  // variable textbox
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateBirthController = TextEditingController();

  String _jk = "";
  String _pilihAgama = "";

  final List<String> agama = [
    "Islam",
    "Protestan",
    "Katholik",
    "Budha",
    "Atheis",
  ];

  @override
  void initState() {
    _dateBirthController.text = '';
    super.initState();
  }

  var _outputName = '';

  @override
  void dispose() {
    // menghapus inputan yang sudah di isi jadi kosong lagi 
    _nameController.dispose();
    // mengeksekusi/menjalankan method
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      _outputName = _nameController.text;
    });

    print("Nama Lengkap : ${_nameController.text}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Nama Lengkap: ${_nameController.text}")),
    );
    // memanggil method clear dibawah
    _clearInput();
  }

  void _clearInput() {
    // membarsihkan isi textbox/input
    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form App')),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Jenis Kelamin",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: "Laki-laki",
                    groupValue: _jk,
                  ),
                ],
              ),

              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _submitForm();
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green, width: 2)
                ),
                  child: Text("Simpan")
              ),
              SizedBox(height: 10),
              Text(
                "Nama: ${_outputName.isEmpty ? "-" : _outputName}",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}