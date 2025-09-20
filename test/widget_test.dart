import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/main.dart';

void main() {
  testWidgets('Tic Tac Toe app test', (WidgetTester tester) async {
    
    await tester.pumpWidget(const TicTacToeApp());

    
    expect(find.text('Tic Tac Toe'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

   
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(); // trigger a frame after the timer

    
    expect(find.text('Player X\'s turn'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('Tap on a cell and verify change', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    await tester.pump(const Duration(seconds: 2));
    await tester.pump();

    // Tap on the first cell.
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();

    // Verify that the cell now contains 'X'
    expect(find.text('X'), findsOneWidget);

    // Verify that it's now player O's turn.
    expect(find.text('Player O\'s turn'), findsOneWidget);
  });

  testWidgets('New game button test', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    await tester.pump(const Duration(seconds: 2));
    await tester.pump();

    // Tap on the first cell.
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();

    // Verify that the cell now contains 'X'
    expect(find.text('X'), findsOneWidget);

    // Tap the New Game button.
    await tester.tap(find.text('New Game'));
    await tester.pump();

    // Verify that the board is reset (no X or O)
    expect(find.text('X'), findsNothing);
    expect(find.text('O'), findsNothing);
    expect(find.text('Player X\'s turn'), findsOneWidget);
  });
}
