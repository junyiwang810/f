import 'dart:ui';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/flashcard.dart';
import 'package:productivity_app/flashcard_view.dart';
import 'package:productivity_app/icons.dart';
// import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'info.dart';
import 'theme.dart';
import 'add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flashcard'),
      title: 'Flashcard',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Flashcard> _flashcards = [
    Flashcard(question: "1) What is my name", answer: "Junyi"),
    Flashcard(question: "2) What year was I born on", answer: "2008"),
    Flashcard(question: "3) What is my favorate color", answer: "orange"),
    Flashcard(question: "4) What is my favorate food", answer: "ice cream"),
    // Flashcard(question: "hello", answer: "hi")
  ];

  openURL() async {
    const url = 'https://www.youtube.com/watch?v=7its9Zg2Ne4';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int _currIndex = 0;
  Color c_b = const Color(0xFFfffffff);
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'Flashcard',
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        home: Builder(
            builder: (context) => Scaffold(
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
                    leading: Builder(builder: (BuildContext context) {
                      return IconButton(
                        onPressed: () {
                          Navigator.of(context).push(_createRoute());
                        },
                        icon: const Icon(Icons.info_outline_rounded),
                        // color: Colors.black,
                      );
                    }),
                    actions: [
                      IconButton(
                          onPressed: () {
                            currentTheme.toggleTheme();
                          },
                          icon: const Icon(
                            Icons.brightness_4_rounded,
                          ))
                    ],
                    // actions: [ChangeThemeButtonWidget()],
                  ),
                  body: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary
                      // Color(0xFF23cdba),
                      // Color(0xFFb3b312)
                    ], stops: [
                      0.1,
                      1
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 40.0),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: FlipCard(
                                front: FlashcardView(
                                  text: _flashcards[_currIndex].question,
                                ),
                                back: FlashcardView(
                                  text: _flashcards[_currIndex].answer,
                                ))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Tooltip(
                              message: 'click to go to next card',
                              verticalOffset: 40,
                              height: 50,
                              child: RawMaterialButton(
                                  onPressed: previousCard,
                                  elevation: 2.0,
                                  fillColor: Colors.white70,
                                  child: Icon(
                                    MyFlutterApp.chevron_left,
                                    size: 35,
                                    color: Colors.grey[900],
                                    // color: Colors.grey[900],
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                  shape: CircleBorder()),
                            ),
                            Tooltip(
                                message: 'click to go to prev card',
                                verticalOffset: 40,
                                height: 50,
                                child: RawMaterialButton(
                                  onPressed: nextCard,
                                  elevation: 2,
                                  fillColor: Colors.white70,
                                  child: Icon(
                                    MyApp1.chevron_right,
                                    size: 35,
                                    color: Colors.grey[900],
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                  shape: CircleBorder(),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  // floatingActionButton: new FloatingActionButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(_createRoute1());
                  //   },
                  //   tooltip: 'Increment',
                  //   child: new Icon(Icons.add),
                  //   backgroundColor: Colors.white70,
                  // ),
                )));
  }

  void nextCard() {
    setState(() {
      _currIndex = (_currIndex + 1 < _flashcards.length) ? _currIndex + 1 : 0;
    });
  }

  void previousCard() {
    setState(() {
      _currIndex =
          (_currIndex - 1 >= 0) ? _currIndex - 1 : _flashcards.length - 1;
    });
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Info(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// Route _createRoute1() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => Add(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       var begin = Offset(0.0, 1.0);
//       var end = Offset.zero;
//       var curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

openURL() async {
  const url = 'https://www.youtube.com/watch?v=7its9Zg2Ne4';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
