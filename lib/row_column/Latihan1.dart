import 'package:flutter/material.dart';

class Latihan1 extends StatelessWidget {
  const Latihan1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        padding: EdgeInsets.all(10),
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8yB6p4A9GL3GkEEogcD4p06Y7vWM2wP_VVbVkcplnKw2nS-fvgf72ZVU&s=10"
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(5)
              ),            
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama: Fakhri"),
                Text("NIS: 12345"),
                Text("Kelas: XII RPL"),
              ],
            ),
          ]
        )
      ),
    );
  }
}