import 'package:flutter/material.dart';
import 'package:tictactoe/entities/tic_tac_toe.dart';
import 'package:tictactoe/widgets/mark_symbol.dart';

class Block extends StatelessWidget {
  final Mark? mark;
  final int row;
  final int col;
  final Function(int row, int col)? onTap;
  const Block({Key? key, this.mark = Mark.empty, required this.row, required this.col, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call(row, col);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: MarkSymbol(mark: mark),
        ),
      ),
    );
  }
}
