import 'package:flutter/material.dart';

import 'loginmodel.dart';

class XOButton extends StatelessWidget {
  final String synbol;
  final Function (int, GameBoardArgs) onClick;
  final int index;

  XOButton({super.key,required this.synbol,required this.onClick,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(onPressed: (){onClick(index, ModalRoute.of(context)!.settings.arguments as GameBoardArgs);
        },style: ElevatedButton.styleFrom(
          primary: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ), child: Text(synbol,style:  TextStyle(color: synbol == "x" ? Colors.red : Colors.green,fontSize: 100,fontWeight: FontWeight.bold))),
      ),);
  }
}
