import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/entities/tic_tac_toe.dart';
import 'package:tictactoe/states/game_state.dart';
import 'package:tictactoe/widgets/block.dart';
import 'package:tictactoe/widgets/mark_symbol.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TicTacToe state = ref.watch(ticTacToeProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: state.isGameOver
                  ? [
                      MarkSymbol(
                        mark: state.getWinner(),
                        size: 32,
                      ),
                      const Text(
                        'Won',
                        style: TextStyle(fontSize: 18, color: Colors.white30),
                      ),
                    ]
                  : [
                      MarkSymbol(
                        mark: state.currentPlayer,
                        size: 32,
                      ),
                      const Text(
                        '\'s turn',
                        style: TextStyle(fontSize: 18, color: Colors.white30),
                      )
                    ],
            ),
            SizedBox(
              height: 32,
            ),
            Expanded(
              flex: 2,
              child: GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 3,
                childAspectRatio: 1,
                children: [
                  for (var i = 0; i < 3; i++)
                    for (var j = 0; j < 3; j++)
                      Block(
                        row: i,
                        col: j,
                        onTap: (row, col) {
                          ref.read(ticTacToeProvider.notifier).addMark(row, col, state.currentPlayer);
                        },
                        mark: state.board[i][j],
                      ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      ref.read(ticTacToeProvider.notifier).reset();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        'Reset'.toUpperCase(),
                        style: TextStyle(fontSize: 16, letterSpacing: 2),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
