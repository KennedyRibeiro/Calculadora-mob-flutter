import 'package:flutter/material.dart';
import 'package:prova_mensal/components/value_box_text.dart';

class NumbersAndOperations extends StatelessWidget {
  final Function callback;
  const NumbersAndOperations(this.callback, {super.key});

  void _handleClicked(String value) {
    callback(value);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          NORow(const ["7", "8", "9", "/"], _handleClicked),
          NORow(const ["4", "5", "6", "x"], _handleClicked),
          NORow(const ["1", "2", "3", "-"], _handleClicked),
          NORow(const ["C", "0", "=", "+"], _handleClicked),
        ],
      ),
    );
  }
}

class NORow extends StatelessWidget {
  final List<String> content;
  final Function callback;
  const NORow(this.content, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          ValueBoxText(content[0], callback),
          ValueBoxText(content[1], callback),
          ValueBoxText(content[2], callback),
          ValueBoxText(content[3], callback, accent: true)
        ],
      ),
    );
  }
}
