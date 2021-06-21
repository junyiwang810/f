import 'package:flutter/material.dart';
// import 'home.dart';

class FlashcardView extends StatelessWidget {
  final String text;

  FlashcardView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      elevation: 3,
      color: Colors.white,
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      )),
    );
  }
}
