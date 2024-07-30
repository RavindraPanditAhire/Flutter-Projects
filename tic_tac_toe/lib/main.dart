import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe game by Ravindra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> _board = List<String>.filled(9, '');
  bool _isXTurn = true;
  String _winner = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double gridSize = constraints.maxWidth / 3;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _makeMove(index);
                            },
                            child: Center(
                              child: Container(
                                width: gridSize,
                                height: gridSize,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    _board[index],
                                    style: TextStyle(
                                      fontSize: gridSize / 2,
                                      color: _board[index] == 'X'
                                         ? Colors.pink
                                          : Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            _winner.isEmpty
               ? Center(child: Container())
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Winner: $_winner',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _board = List<String>.filled(9, '');
                  _winner = '';
                  _isXTurn = true;
                });
              },
              child: Text('Reset'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _makeMove(int index) {
    if (_winner.isNotEmpty) return;
    if (_board[index].isNotEmpty) return;

    setState(() {
      _board[index] = _isXTurn? 'X' : 'O';
      _isXTurn =!_isXTurn;
    });

    _checkWinner();
  }

  void _checkWinner() {
    for (int i = 0; i < 3; i++) {
      if (_board[i] == _board[i + 3] && _board[i] == _board[i + 6] && _board[i].isNotEmpty) {
        setState(() {
          _winner = _board[i];
        });
        return;
      }
      if (_board[i * 3] == _board[i * 3 + 1] && _board[i * 3] == _board[i * 3 + 2] && _board[i * 3].isNotEmpty) {
        setState(() {
          _winner = _board[i * 3];
        });
        return;
      }
    }
    if (_board[0] == _board[4] && _board[0] == _board[8] && _board[0].isNotEmpty) {
      setState(() {
        _winner = _board[0];
      });
      return;
    }
    if (_board[2] == _board[4] && _board[2] == _board[6] && _board[2].isNotEmpty) {
      setState(() {
        _winner = _board[2];
      });
      return;
    }
  }
}