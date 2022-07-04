import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/entities/tic_tac_toe.dart';

class TicTacToeNotifier extends StateNotifier<TicTacToe> {
  TicTacToeNotifier()
      : super(TicTacToe(board: [
          [Mark.empty, Mark.empty, Mark.empty],
          [Mark.empty, Mark.empty, Mark.empty],
          [Mark.empty, Mark.empty, Mark.empty],
        ], currentPlayer: Mark.X));

  void reset() {
    state = TicTacToe(board: [
      [Mark.empty, Mark.empty, Mark.empty],
      [Mark.empty, Mark.empty, Mark.empty],
      [Mark.empty, Mark.empty, Mark.empty],
    ], currentPlayer: Mark.X, isGameOver: false);
  }

  void addMark(int row, int col, Mark mark) {
    if (!state.isGameOver) {
      state.addMark(row, col, mark);
      state.isGameOver = state.checkGameOver();
      state = state.cloneWith(
        board: state.board,
      );
    }
  }
}

final ticTacToeProvider = StateNotifierProvider<TicTacToeNotifier, TicTacToe>((_) => TicTacToeNotifier());
