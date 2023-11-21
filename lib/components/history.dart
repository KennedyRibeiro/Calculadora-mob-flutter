import 'package:flutter/material.dart';

class History extends StatelessWidget {
  final List<String> history;
  const History(this.history, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text(
            "Histórico",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16), // Adiciona um espaçamento entre o título e a lista
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(history[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
