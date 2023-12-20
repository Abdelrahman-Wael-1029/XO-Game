import 'Board.dart';
import 'dart:io';

class BoardXO extends Board {
  int _n;
  int _m;
  BoardXO(this._n, this._m)
      : super(List.generate(_n, (index) => List.generate(_m, (index) => ' ')));
  @override
  void displayBoard() {
    print('    0   1   2   ');
    for (int i = 0; i < _n; i++) {
      for (int j = 0; j < _m; j++) {
        if (j == 0) {
          stdout.write('$i ');
        }
        stdout.write('| ${board[i][j]} ');
        if (j == _m - 1) {
          stdout.write('|');
        }
      }
      print('');
    }
    print('---------------------------------------------');
  }

  @override
  bool updateBoard(List<int> moveList, String symbol) {
    if (validateMove(moveList)) {
      board[moveList[0]][moveList[1]] = symbol;
      return true;
    }
    return false;
  }

  @override
  bool validateMove(List<int> moveList) {
    if (moveList.length != 2) {
      return false;
    }
    if (moveList[0] < 0 || moveList[0] > 2) {
      return false;
    }
    if (moveList[1] < 0 || moveList[1] > 2) {
      return false;
    }
    if (board[moveList[0]][moveList[1]] != ' ') {
      return false;
    }
    return true;
  }

  @override
  bool isWinner() {
    // check rows
    for (int i = 0; i < _n; i++) {
      if (board[i][0] != ' ' &&
          board[i][0] == board[i][1] &&
          board[i][1] == board[i][2]) {
        return true;
      }
    }
    // check columns
    for (int i = 0; i < _m; i++) {
      if (board[0][i] != ' ' &&
          board[0][i] == board[1][i] &&
          board[1][i] == board[2][i]) {
        return true;
      }
    }
    // check diagonals
    if (board[0][0] != ' ' &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
      return true;
    }
    if (board[0][2] != ' ' &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
      return true;
    }
    return false;
  }

  @override
  bool isDraw() {
    for (int i = 0; i < _n; i++) {
      for (int j = 0; j < _m; j++) {
        if (board[i][j] == ' ') {
          return false;
        }
      }
    }
    return true;
  }
}
