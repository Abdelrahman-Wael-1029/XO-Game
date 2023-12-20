
abstract class Player {
  String _name;
  String _symbol;
  int _score;

  Player(String this._name, String this._symbol, {score = 0}) : _score = score;

  String get name => _name;
  String get symbol => _symbol;
  int get score => _score;
  List<int> getMove();

  bool validateMove(List<int> moveList);

  void addScore() {
    _score++;
  }
}
