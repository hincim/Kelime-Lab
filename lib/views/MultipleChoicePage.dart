import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ilk_proje/controller/CounterCont%C4%B1oller.dart';
import 'package:ilk_proje/controller/WordController.dart';
import 'package:ilk_proje/views/ResultPage.dart';
import 'package:provider/provider.dart';

class MultipleChoicePage extends StatelessWidget {
  const MultipleChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    context.read<CounterController>().reset();
    context.read<WordController>().fetchRandomWords();
    context.read<CounterController>().reset();

    return Consumer<WordController>(
      builder: (context, wordController, child) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade500, Colors.purple.shade800],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                )
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              wordController.words[0].english,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.purple.shade800,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade800, Colors.purple.shade600],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            )
            ,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight / 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<CounterController>(
                      builder: (context, counterController, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Doğru: ${counterController.trueAnswer}  Yanlış: ${counterController.falseAnswer}",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                                "${counterController.counter}/${wordController.words.length}",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white))
                          ],
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), //
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenHeight / 65),
                        child: Center(
                            child: Text(
                          wordController.correctWord.english,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 20,
                  ),
                  buildAnswerCard(
                      screenHeight,
                      wordController.options[0].turkish,
                      context,
                      wordController),
                  buildAnswerCard(
                      screenHeight,
                      wordController.options[1].turkish,
                      context,
                      wordController),
                  buildAnswerCard(
                      screenHeight,
                      wordController.options[2].turkish,
                      context,
                      wordController),
                  buildAnswerCard(
                      screenHeight,
                      wordController.options[3].turkish,
                      context,
                      wordController),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector buildAnswerCard(double screenHeight, String answer,
      BuildContext context, WordController wordController) {
    return GestureDetector(
      onTap: () {
        context.read<CounterController>().increment();
        answer == context.read<WordController>().correctWord.turkish
            ? context.read<CounterController>().trueToAnswer()
            : context.read<CounterController>().falseToAnswer();
        context.read<WordController>().fetchRandomWords();

        if (context.read<CounterController>().counter ==
            wordController.words.length) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  trueAnswer: context.read<CounterController>().trueAnswer,
                  falseAnswer: context.read<CounterController>().falseAnswer,
                ),
              )).then(
            (value) {
                context.read<CounterController>().reset();
              },
          );
        }
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), //
            gradient: LinearGradient(
              colors: [
                Colors.white24,
                Colors.purple.shade300,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenHeight / 65),
            child: Center(
                child: Text(
              answer,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black),
            )),
          ),
        ),
      ),
    );
  }
}
