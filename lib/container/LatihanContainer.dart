import 'package:flutter/material.dart';

class LatihanContainer extends StatelessWidget {
  const LatihanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.greenAccent[400],
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
        // child: Text("SMK ASSALAAM BANDUNG",
        //   style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.white,
        //   ),
        // ),
      child: Container(
        height: 60,
        width: 200,
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(50),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text("Kelas XII RPL",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}