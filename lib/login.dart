import 'package:flutter/material.dart';
import 'package:xogame/xoscreen.dart';

import 'loginmodel.dart';

class LogIn extends StatelessWidget {
  static const String routeName = "login";

  LogIn({Key? key}) : super(key: key);

  String player1 = "";
  String player2 = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Xo",
              style: TextStyle(color: Color(0xFFEECC39), fontSize: 25),
            ),
            Text(
              "Game",
              style: TextStyle(color: Colors.black87, fontSize: 25),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroung.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "X",
                            style: TextStyle(
                                color: Color(0xFFEED54A), fontSize: 85),
                          ),
                          Text(
                            "O",
                            style: TextStyle(color: Colors.black, fontSize: 85),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter name Player 1";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Player 1",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  onChanged: (text) {
                    player1 = text;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter name Player 2";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Player 2",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  onChanged: (text) {
                    player2 = text;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pushReplacementNamed(
                          context, XOScreen.routeName,
                          arguments: GameBoardArgs(player1, player2));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: Text("Start Game",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
