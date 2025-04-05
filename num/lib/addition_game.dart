// addition_game.dart
import 'package:flutter/material.dart';
import 'math_game_base.dart';

class AdditionGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MathGameBase(
      operation: Operation.addition,
    );
  }
}
