import 'BoardXO.dart';
import 'PlayerXO.dart';
import 'gameManager.dart';
import 'dart:io';

void main() {
  try{
  print('Hello World');
  int choice = 1;
  
  BoardXO board = BoardXO(3, 3);
  PlayerXO player1 = PlayerXO('Player 1', 'X');
  PlayerXO player2 = PlayerXO('Player 2', 'O');
  List<PlayerXO> players = [player1, player2];
  gameManager game = gameManager(board, players);
  
  while (choice == 1) {
    board = BoardXO(3, 3);
    game = gameManager(board, players);
    game.run();
    print(
        'Score:\n ${player1.name}: ${player1.score} \n ${player2.name}: ${player2.score}');
    print("");
    print('1. Start new game');
    print("2. exit");
    choice = int.parse(stdin.readLineSync()!);
  }
  }catch(e){
    
  }
}
