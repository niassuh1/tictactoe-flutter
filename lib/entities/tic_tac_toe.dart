enum Mark {
  X,
  O,
  empty,
}

List<List<Mark>> emptyBoard = [
  [Mark.empty, Mark.empty, Mark.empty],
  [Mark.empty, Mark.empty, Mark.empty],
  [Mark.empty, Mark.empty, Mark.empty],
];

class TicTacToe {
  List<List<Mark>> board;
  Mark currentPlayer;
  bool isGameOver;
  TicTacToe({required this.board, required this.currentPlayer, this.isGameOver = false});

  void addMark(int row, int col, Mark mark) {
    if (board[row][col] != Mark.empty) {
      return;
    }
    board[row][col] = mark;
    currentPlayer = currentPlayer == Mark.X ? Mark.O : Mark.X;
  }

  bool checkGameOver() {
    // check rows
    for (var i = 0; i < 3; i++) {
      if (board[i][0] != Mark.empty && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
        return true;
      }
    }
    // check columns
    for (var i = 0; i < 3; i++) {
      if (board[0][i] != Mark.empty && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
        return true;
      }
    }
    // check diagonals
    if (board[0][0] != Mark.empty && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
      return true;
    }
    if (board[0][2] != Mark.empty && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
      return true;
    }

    return false;
  }

  Mark getWinner() {
    if (currentPlayer == Mark.O) {
      return Mark.X;
    } else {
      return Mark.O;
    }
  }

  TicTacToe cloneWith({List<List<Mark>>? board, Mark? currentPlayer, bool? isGameover}) {
    return TicTacToe(
        board: board ?? this.board,
        currentPlayer: currentPlayer ?? this.currentPlayer,
        isGameOver: isGameover ?? isGameOver);
  }
}
