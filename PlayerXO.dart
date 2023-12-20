import 'dart:io';
import 'Player.dart';

class PlayerXO extends Player {
  PlayerXO(_name, _symbol, {score = 0}) : super(_name, _symbol, score: score);

  @override
  List<int> getMove() {
    String? move;
    List<int> moveList = [];
    try {
      move = stdin.readLineSync();
      if (move != null && move.isNotEmpty) {
        moveList = move.trim().split(' ').map((e) => int.parse(e)).toList();
      }
      while (move == null || !validateMove(moveList)) {
        print('------------ Invalid move, try again ------------');

        move = stdin.readLineSync();
        if (move != null && move.isNotEmpty) {
          moveList = move.split(' ').map((e) => int.parse(e)).toList();
        }
      }

      return moveList;
    } catch (e) {
      print('------------ Invalid move, try again ------------');

      return getMove();
    }
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
    return true;
  }
}
