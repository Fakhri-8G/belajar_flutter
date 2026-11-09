import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form-page');
              }, 
              child: Text('Masuk Form Date Picker'),
            ),
            const SizedBox(height: 5),
            
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              }, 
              child: Text('Masuk About'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list-screen');
              }, 
              child: Text('Masuk List Screen'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail-screen');
              }, 
              child: Text('Masuk Detail Produk || Error'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/grid');
              }, 
              child: Text('Masuk Grid'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/instagram');
              }, 
              child: Text('Masuk Instagram'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/column-widget');
              }, 
              child: Text('Masuk Column Widget'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/latihan1');
              }, 
              child: Text('Masuk Latihan 1'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/latihan2');
              }, 
              child: Text('Masuk Latihan 2'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row-column-widget');
              }, 
              child: Text('Masuk Row Column Widget'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row-widget');
              }, 
              child: Text('Masuk Row Widget'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              }, 
              child: Text('Masuk Form'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/input-page');
              }, 
              child: Text('Masuk Form Input dan Output'),
            ),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form-eskul-page');
              }, 
              child: Text('Masuk Form Ekstrakulikuler'),
            ),
            const SizedBox(height: 5),


          ],
        ),
      ),
    );
  }
}