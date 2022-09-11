import 'package:flutter/material.dart';
import 'package:planoinclinado/TriangleClipper.dart';
import 'dart:math' as mt;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'PLANO INCLINADO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _rotation0 = 0, _rotation1 = 0, _rotation2 = 0;
  bool showBackground = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () => setState(() {
                          _rotation2 -= 9;
                          _rotation0 -= 9;
                          _rotation1 -= 9;
                        }),
                    onLongPress: () => setState(() {
                          _rotation2 -= 45;
                          _rotation0 -= 45;
                          _rotation1 -= 45;
                        }),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "←",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
                FloatingActionButton(
                    heroTag: "reset",
                    mini: true,
                    backgroundColor: Colors.red[900],
                    child: const Text(
                      "RESET",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () => setState(() {
                          _rotation0 = 0;
                          _rotation1 = 0;
                          _rotation2 = 0;
                        })),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () => setState(() {
                          _rotation2 += 9;
                          _rotation0 += 9;
                          _rotation1 += 9;
                        }),
                    onLongPress: () => setState(() {
                          _rotation2 += 45;
                          _rotation0 += 45;
                          _rotation1 += 45;
                        }),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "→",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () => setState(() {
                          _rotation0 -= 9;
                        }),
                    onLongPress: () => setState(() {
                          _rotation0 -= 45;
                        }),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "←",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
                FloatingActionButton(
                    heroTag: "show",
                    mini: true,
                    backgroundColor:
                        showBackground ? Colors.yellow : Colors.white,
                    child: Text(
                      showBackground ? "Hide" : "Show",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () => setState(() {
                          showBackground = !showBackground;
                        })),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () => setState(() {
                          _rotation0 += 9;
                        }),
                    onLongPress: () => setState(() {
                          _rotation0 += 45;
                        }),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "→",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => setState(() {
                          _rotation1 -= 9;
                        }),
                    onLongPress: () => setState(() {
                          _rotation1 -= 45;
                        }),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "←",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
                ElevatedButton(
                    onPressed: () => setState(() {
                          _rotation1 += 9;
                        }),
                    onLongPress: () => setState(() {
                          _rotation1 += 45;
                        }),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "→",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () => setState(() {
                          _rotation2 -= 9;
                        }),
                    onLongPress: () => setState(() {
                          _rotation2 -= 45;
                        }),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "←",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () => setState(() {
                          _rotation2 += 9;
                        }),
                    onLongPress: () => setState(() {
                          _rotation2 += 45;
                        }),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "→",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
            SizedBox(height: s.height * .05),
            Stack(
              alignment: Alignment.center,
              children: [
                RotationTransition(
                  turns: AlwaysStoppedAnimation(_rotation0 / 360),
                  child: Container(
                      color: !showBackground ? Colors.grey[300] : Colors.white,
                      width: s.width,
                      height: s.width,
                      child: !showBackground
                          ? const SizedBox()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: s.width / 2,
                                      height: s.width / 2,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.white,
                                                Color.fromARGB(
                                                    255, 205, 234, 255),
                                                Color.fromARGB(
                                                    255, 93, 188, 255),
                                                Color.fromARGB(
                                                    255, 0, 101, 172),
                                              ]),
                                          border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              right: BorderSide(
                                                  color: Colors.yellow,
                                                  width: 1))),
                                    ),
                                    Container(
                                      width: s.width / 2,
                                      height: s.width / 2,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.white,
                                                Color.fromARGB(
                                                    255, 205, 234, 255),
                                                Color.fromARGB(
                                                    255, 93, 188, 255),
                                                Color.fromARGB(
                                                    255, 0, 101, 172),
                                              ]),
                                          border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              left: BorderSide(
                                                  color: Colors.black,
                                                  width: 1))),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: s.width / 2,
                                      height: s.width / 2,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromARGB(255, 62, 232, 0),
                                                Color.fromARGB(
                                                    255, 173, 119, 3),
                                                Color.fromARGB(255, 100, 69, 1),
                                                Colors.black,
                                              ]),
                                          border: Border(
                                              top: BorderSide(
                                                color: Colors.yellow,
                                                width: 1,
                                              ),
                                              right: BorderSide(
                                                  color: Colors.yellow,
                                                  width: 1))),
                                    ),
                                    Container(
                                      width: s.width / 2,
                                      height: s.width / 2,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromARGB(255, 62, 232, 0),
                                                Color.fromARGB(
                                                    255, 173, 119, 3),
                                                Color.fromARGB(255, 100, 69, 1),
                                                Colors.black,
                                              ]),
                                          border: Border(
                                              top: BorderSide(
                                                color: Colors.yellow,
                                                width: 0.5,
                                              ),
                                              left: BorderSide(
                                                  color: Colors.yellow,
                                                  width: 0.5))),
                                    )
                                  ],
                                ),
                              ],
                            )),
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(_rotation1 / 360),
                  child: ClipPath(
                    clipper: TriangleClipper(15),
                    child: Container(
                      width: s.width * .75,
                      height: s.width * .75,
                      color: Colors.blue,
                    ),
                  ),
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(_rotation2 / 360),
                  child: ClipPath(
                    clipper: TriangleClipper(15),
                    child: Container(
                      width: s.width / 2,
                      height: s.width / 2,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
