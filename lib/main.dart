import 'package:flutter/material.dart';

enum TileState { white, black, open, illegeal }

void main() => runApp(Go());

BoxDecoration tileDecoration() {
  return BoxDecoration(
    color: Colors.yellow[700],
    border: Border.all(
      width: 1, //                   <--- border width here
    ),
  );
}

BoxDecoration whiteStone() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(
      width: 1, //                   <--- border width here
    ),
    borderRadius:
        BorderRadius.all(Radius.circular(5.0) //         <--- border radius here
            ),
  );
}

BoxDecoration blackStone() {
  return BoxDecoration(
    color: Colors.black,
    border: Border.all(
      width: 1, //                   <--- border width here
    ),
    borderRadius:
        BorderRadius.all(Radius.circular(5.0) //         <--- border radius here
            ),
  );
}

class Go extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Go",
      home: Board(),
    );
  }
}

class Board extends StatefulWidget {
  @override
  BoardState createState() => BoardState();
}

class BoardState extends State<Board> {
  final int rows = 9;
  final int cols = 9;

  List<List<TileState>> uiState;
  List<List<bool>> tiles;

  void resetBoard() {
    uiState = new List<List<TileState>>.generate(rows, (row) {
      return new List<TileState>.filled(cols, TileState.open);
    });

    tiles = new List<List<bool>>.generate(rows, (row) {
      return new List<bool>.filled(cols, false);
    });
  }

  @override
  void initState() {
    resetBoard();
    super.initState();
  }

  Widget buildBoard() {
    return Scaffold(
      body: GridView.builder(
          itemCount: 81,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Container(
                decoration: tileDecoration(),
                height: 40.0,
                width: 40.0,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Go'),
      ),
      body: Container(
        child: Center(
          child: buildBoard(),
        ),
      ),
    );
  }
}
