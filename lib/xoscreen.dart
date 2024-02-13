import 'package:flutter/material.dart';
import 'loginmodel.dart';
import 'xobutton.dart';

class XOScreen extends StatefulWidget {
  static const String routeName = "xo";

  XOScreen({Key? key}) : super(key: key);

  @override
  State<XOScreen> createState() => _XOScreenState();
}

class _XOScreenState extends State<XOScreen> {
  List<String> board = [
    "", "", "",
    "", "", "",
    "", "", ""
  ];

  int counter = 0;
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    GameBoardArgs args =
    ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroung.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xB34CAF50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "${args.player1}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(" $player1Score",style: TextStyle(
                        fontSize: 25,
                      ),)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("X",style: TextStyle(color: Colors.black,fontSize: 40),),
                      Text("O",style: TextStyle(color: Color(0xFFEED54A),fontSize: 40),)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xCDF1372B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${args.player2}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("$player2Score",style: TextStyle(fontSize: 25),)
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XOButton(
                    synbol: board[0],
                    onClick: OnButtonClick,
                    index: 0,
                  ),
                  XOButton(
                    synbol: board[1],
                    onClick: OnButtonClick,
                    index: 1,
                  ),
                  XOButton(
                    synbol: board[2],
                    onClick: OnButtonClick,
                    index: 2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XOButton(
                    synbol: board[3],
                    onClick: OnButtonClick,
                    index: 3,
                  ),
                  XOButton(
                    synbol: board[4],
                    onClick: OnButtonClick,
                    index: 4,
                  ),
                  XOButton(
                    synbol: board[5],
                    onClick: OnButtonClick,
                    index: 5,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XOButton(
                    synbol: board[6],
                    onClick: OnButtonClick,
                    index: 6,
                  ),
                  XOButton(
                    synbol: board[7],
                    onClick: OnButtonClick,
                    index: 7,
                  ),
                  XOButton(
                    synbol: board[8],
                    onClick: OnButtonClick,
                    index: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void OnButtonClick(int index,GameBoardArgs args) {
    if (board[index].isNotEmpty) return;
    if (counter % 2 == 0) {
      board[index] = "o";
    } else {
      board[index] = "x";
    }

    if (CheckWinner(board[index])) {
      if (board[index] == "o") {
        player1Score++;
        showWinDialog(args.player1);
      } else {
        player2Score++;
        showWinDialog(args.player2);
      }
      resetBoard();
      return;
    }

    counter++;
    if (counter == 9) {
      resetBoard();
      return;
    }
    setState(() {});
  }

  void resetBoard(){
    board = [
      "","","",
      "","","",
      "","",""
    ];
    setState(() {});
  }

  bool CheckWinner(String symbol){
    if(board[0] == symbol && board[1] == symbol && board[2] == symbol){
      return true;
    }
    if(board[3] == symbol && board[4] == symbol && board[5] == symbol){
      return true;
    }
    if(board[6] == symbol && board[7] == symbol && board[8] == symbol){
      return true;
    }
    if(board[0] == symbol && board[3] == symbol && board[6] == symbol){
      return true;
    }
    if(board[1] == symbol && board[4] == symbol && board[7] == symbol){
      return true;
    }
    if(board[2] == symbol && board[5] == symbol && board[8] == symbol){
      return true;
    }
    if(board[0] == symbol && board[4] == symbol && board[8] == symbol){
      return true;
    }
    if(board[2] == symbol && board[4] == symbol && board[6] == symbol){
      return true;
    }
    return false;
  }

  void showWinDialog(String winner){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Congratulations"),
        content: Text("$winner won the challenge",style: TextStyle(fontSize: 18),),
        actions: [
          TextButton(onPressed:(){Navigator.of(context).pop();}, child: Text("OK"))
        ],
      );
    });
  }
}
