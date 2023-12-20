abstract class Board{
  dynamic _board;

  Board(dynamic this._board);
  void displayBoard();
  bool validateMove(List<int> moveList); 
  get board => _board;
  bool updateBoard(List<int> moveList, String symbol);
  bool isWinner();
  bool isDraw();
}