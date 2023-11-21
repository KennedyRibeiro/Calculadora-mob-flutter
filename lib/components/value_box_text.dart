import 'package:flutter/material.dart';

class ValueBoxText extends StatelessWidget {
  final String text;
  final Function callback;
  final bool accent;

  const ValueBoxText(this.text, this.callback,
      {this.accent = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: accent ? Colors.amber[900] : Colors.grey[300],
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => callback(text),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 24,
                  color: accent ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
