import 'package:flutter/material.dart';
// import 'main.dart';
import 'main.dart';
// import 'main_page.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text('Flashcard',
            style: TextStyle(
              fontSize: 30,
            )),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(30))),
        toolbarHeight: 100,
        backgroundColor: Colors.white30,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    // Color(0xFF23cdba), Color(0xFFb3b312)
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary
                  ],
                  stops: [0.1, 1],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          padding: EdgeInsets.only(top: 150),
          child: Center(
            child: Container(
              height: 700,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              padding: EdgeInsets.only(top: 100, left: 30, right: 20),
              child: Center(
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      'This app was made by a grade 7 student for his genius hour. FlashCard is a flashcard app, it has a really simple and intuative UI.',
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Click the image below to install flutter:',
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      onPressed: () {
                        openURL();
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 4),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Image(
                        image: AssetImage('assets/images/vid_thumbnail.png'),
                      ),
                    )
                  ])),
            ),
          )),
    );
  }
}
