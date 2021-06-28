import 'package:flutter/material.dart';

// import 'main.dart';
// import 'main.dart';
// import 'main_page.dart';
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

String answer = "";

class _AddState extends State<Add> {
  final answerTEC = TextEditingController();

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
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        toolbarHeight: 100,
        backgroundColor: Colors.white30,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            // Color(0xFF23cdba), Color(0xFFb3b312)
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary
          ], stops: [
            0.1,
            1
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          padding: EdgeInsets.only(top: 150),
          child: Center(
            child: Container(
                height: 700,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                // margin: EdgeInsets.only(left: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter question here",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.green, width: 3),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 50,
                    ),
                    Container(
                        width: 300,
                        child: TextField(
                          controller: answerTEC,
                          decoration: InputDecoration(
                            labelText: 'Enter answer',
                            prefixIcon: Icon(Icons.question_answer),
                            border: OutlineInputBorder(),
                          ),
                        )),
                    new SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        answer = answerTEC.text;
                        print(answer);
                      },
                      child: Text('Submit'),
                    )
                  ],
                )),
          )),
    );
  }
}
