import 'package:flutter/material.dart';
import 'package:tictactoe/app_style.dart';

import 'package:tictactoe/entities/tic_tac_toe.dart';

class MarkSymbol extends StatelessWidget {
  final Mark? mark;
  final double? size;
  const MarkSymbol({Key? key, this.mark, this.size = 42}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mark == Mark.empty) {
      return SizedBox();
    }
    return Icon(
      mark == Mark.X ? Icons.close : Icons.circle_outlined,
      color: mark == Mark.X ? AppStyle.xColor : AppStyle.oColor,
      size: size,
    );
  }
}
