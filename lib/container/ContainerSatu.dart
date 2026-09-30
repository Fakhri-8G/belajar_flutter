import 'package:flutter/material.dart';

class ContainerSatu extends StatelessWidget {
  const ContainerSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8yB6p4A9GL3GkEEogcD4p06Y7vWM2wP_VVbVkcplnKw2nS-fvgf72ZVU&s=10"
          ),
          fit: BoxFit.fill,
        ),
      ),
        child: Text("Lorem ipsum dolor sit amet, consectetur ads"),
    );
  }
}