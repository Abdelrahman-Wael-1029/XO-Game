import "Board.dart";
import "Player.dart";

class gameManager {
  Board board;
  List<Player> players;

  gameManager(this.board, this.players);

  void run() {
    int turn = 0;
    while (true) {
      board.displayBoard();
      print('${players[turn].name}\'s enter your move (row[0-2] column[0-2]):');
      
      List<int> moveList = players[turn].getMove();
      while (!board.updateBoard(moveList, players[turn].symbol)) {
        print('--------------- cannot move here ---------------');
        moveList = players[turn].getMove();
      }
      if (board.isWinner()) {
        board.displayBoard();
        print('${players[turn].name} wins!');
        players[turn].addScore();
        break;
      }
      if (board.isDraw()) {
        board.displayBoard();
        print('Draw!');
        break;
      }
      turn = (turn + 1) % 2;
    }
  }
}
