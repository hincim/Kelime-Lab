import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/WordController.dart';

class WordsListView extends StatelessWidget {
  const WordsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WordController>(
      builder: (context, wordController, child) {
        if(wordController.words.isEmpty){
          return Text("Kelime bulunamadı");
        }
        return ListView.builder(
          itemCount: wordController.words.length,
          itemBuilder: (context, index) {
            final word = wordController.words[index];
            return Dismissible(
              key: ValueKey(word.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                wordController.deleteWord(word.id!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${word.english} kelimesi silindi.")),
                );
              },
              child: Card(
                elevation: 3,
                color: Colors.white70,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(word.english, style: const TextStyle(fontSize: 16)),
                      Text(word.turkish, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
