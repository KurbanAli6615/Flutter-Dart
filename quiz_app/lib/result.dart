import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.resultScore, this.resetHandler);

  final int resultScore;
  final VoidCallback resetHandler;

  String get resultPhase {
    String resultText;
    if (resultScore <= 8) {
      resultText = "You'r awasome";
    } else if (resultScore <= 12) {
      resultText = "Pretty Likeable! ";
    } else if (resultScore <= 16) {
      resultText = "You'r strenge..?";
    } else {
      resultText = "You are so bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text(
              "Restart Quiz !",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
