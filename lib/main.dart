import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TrickOrTreat(),
    );
  }
}

class TrickOrTreat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.black,
            child: Text(
              " Please don't click that button ",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage("images/spooky_bg.jpg"),
            fit: BoxFit.fitWidth,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: RaisedButton(
                    color: Colors.black,
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Halloween())),
                    child: Text(
                      "Trick or Treat",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                    "https://media.giphy.com/media/h2CfczI1ggcspHZ26z/giphy.gif"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Halloween extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var str = [
      'H',
      'A',
      'P',
      'P',
      'Y',
      ' ',
      'H',
      'A',
      'L',
      'L',
      'O',
      'W',
      'E',
      'E',
      'N',
      ' '
    ];
    int i = 0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2, mainAxisSpacing: 2, crossAxisCount: 10),
              itemCount: 100 //(height * width) ~/ pow(100, 2)
              ,
              itemBuilder: (context, index) {
                if (index % 16 == 0) {
                  i = 0;
                } else {
                  i++;
                }
                try {
                  return Expanded(
                    child: GridTile(
                      child: Container(
                        color: i % 2 == 0
                            ? Colors.orangeAccent
                            : Colors.deepOrangeAccent,
                        child: Center(
                          child: Text(
                            str[i],
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  );
                } catch (e) {
                  return Expanded(
                    child: GridTile(
                      child: Container(
                        color: i % 2 == 0
                            ? Colors.orangeAccent
                            : Colors.deepOrangeAccent,
                        child: Center(
                          child: Text(
                            str[15],
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Image.network(
                      "https://media.giphy.com/media/3oriO7YaU1bnRFVREk/giphy.gif"),
                ),
                Container(
                    color: Colors.white,
                    child: Text(
                      "👻Happy Halloween🎃",
                      style: TextStyle(fontSize: 40),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
