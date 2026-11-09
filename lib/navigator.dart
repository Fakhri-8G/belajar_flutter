import 'package:belajar_flutter/list/list-screen.dart';
import 'package:flutter/material.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ListScreen();
                },
              ),
            );
          }, 
          child: Text("List Screen"))
      ],
    );
  }
}