import 'package:flutter/material.dart';

class Latihan2 extends StatelessWidget {
  const Latihan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 200,
        margin: EdgeInsets.all(10),
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text("Nama: Fakhri"),
                  Text("NIS: 12345"),
                  Text("Kelas: XII RPL 1"),
              ],
            ),
            Row(children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8yB6p4A9GL3GkEEogcD4p06Y7vWM2wP_VVbVkcplnKw2nS-fvgf72ZVU&s=10"
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),            
                ),
              ],
            ),
          ]
        )
      ),
    );
  }
}