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

class Go extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  void resetBoard() {
    uiState = new List<List<TileState>>.generate(rows, (row) {
      return new List<TileState>.filled(cols, TileState.open);
    });
  }

  @override
  void initState() {
    resetBoard();
    super.initState();
  }

  Widget buildBoard() {
    List<Row> boardRow = <Row>[];
    for (int i = 0; i < rows; i++) {
      List<Widget> rowChildren = <Widget>[];
      for (int j = 0; j < cols; j++) {
        TileState state = uiState[i][j];
        if (state == TileState.open) {
          rowChildren.add(GestureDetector(
            child: Listener(
              child: Container(
                decoration: tileDecoration(),
                height: 40.0,
                width: 40.0,
              ),
            ),
          ));
        }
      }
      boardRow.add(Row(
        children: rowChildren,
        mainAxisAlignment: MainAxisAlignment.center,
        key: ValueKey<int>(i),
      ));
    }

    return Container(
      color: Colors.grey[50],
      child: Column(
        children: boardRow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go'),
      ),
      body: Container(
        color: Colors.grey[50],
        child: Center(
          child: buildBoard(),
        ),
      ),
    );
  }
}
