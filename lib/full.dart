///import 'dart:convert';
///import 'dart:ffi';
///import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

final variavel = ValueNotifier('0');

class Dado extends StatefulWidget {
  final int TipoDado;
  const Dado({Key? key, required this.TipoDado}) : super(key: key);

  @override
  _DadoState createState() => _DadoState(TipoDado);
}

class _DadoState extends State<Dado> {
  int itipoDado;
  _DadoState(
    this.itipoDado,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
//código ---

            variavel.value = valorDado(itipoDado);
          });
        },
        child: Text(
          '• • •  • • • ',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 20));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Home_State createState() => Home_State();
}

class Home_State extends State<Home> {
  get column => null;
  var app = "RPG   -   DADOS"; //valor/variavel

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RPG - DICE",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(app),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            Icon(Icons.notifications_active),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple, Colors.red],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft)),
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.3, 0.7],
            colors: [Colors.blue, Colors.pinkAccent, Colors.greenAccent],
          )),
          alignment: Alignment.center,
          child: Wrap(
            children: [
              //1
              Container(
                  alignment: Alignment.center,
                  child: Wrap(children: [
                    Container(
                      child: const Dado(
                        TipoDado: 4,
                      ),
                      margin: EdgeInsets.only(right: 10),
                      width: 80,
                      height: 80,
                    ),

                    //2
                    Container(
                      child: const Dado(TipoDado: 6),
                      margin: EdgeInsets.only(bottom: 50),
                      width: 80,
                      height: 80,
                    ),
                    Container(
                        child: const Dado(
                          TipoDado: 8,
                        ),
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(left: 10)),
                  ])),

//////////////////////////////////////////////

              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(),
                  child: Wrap(children: [
                    //4
                    Container(
                      child: const Dado(
                        TipoDado: 12,
                      ),
                      margin: EdgeInsets.only(top: 10, left: 50),
                      width: 80,
                      height: 80,
                    ),

                    //5
                    Container(
                      child: const Dado(
                        TipoDado: 20,
                      ),
                      margin: EdgeInsets.only(top: 50, left: 20),
                      width: 80,
                      height: 80,
                    ),
                    Container(
                      child: const Dado(
                        TipoDado: 100,
                      ),
                      margin: EdgeInsets.only(top: 10, right: 50, left: 20),
                      width: 80,
                      height: 80,
                    ),
                    //6
                  ])),

              /////////////
              Container(
                alignment: Alignment.center,
                child: ValueListenableBuilder<String>(
                    valueListenable: variavel,
                    builder: (context, variavel, _) {
                      return Text(
                        "O valor é  " + variavel,
                        style: TextStyle(
                            fontSize: 30, color: Colors.grey.shade800),
                      );
                    }),
                margin: EdgeInsets.only(top: 40),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String valorDado(int d) {
  // d = 4
  Random random = Random();
  d--;

  return (random.nextInt(d) + 1).toString();
}
/////////////////////////////////////////////////
