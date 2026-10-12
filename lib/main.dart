import 'package:belajar_flutter/container/LatihanContainer.dart';
import 'package:belajar_flutter/list/list-screen.dart';
import 'package:belajar_flutter/row_column/ColumnWidget.dart';
import 'package:belajar_flutter/row_column/Latihan1.dart';
import 'package:belajar_flutter/row_column/Latihan2.dart';
import 'package:belajar_flutter/row_column/RowColumnWidget.dart';
import 'package:belajar_flutter/row_column/RowWidget.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/container/ContainerSatu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text("Flutter App"),
        backgroundColor: Colors.amber,
        centerTitle: true,
       ),
       body: ListScreen(),
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text("Hello Flutter", style: TextStyle(
       fontSize: 30,
       fontWeight: FontWeight.bold,
       color: Colors.cyan,
      ),
     ),
    );
  }
}