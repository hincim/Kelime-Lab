import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/WordController.dart';
import '../model/Word.dart';
import '../util/OptionCard.dart';
import 'ResultPage.dart';

class MultipleChoicePage extends StatefulWidget {
  MultipleChoicePage({super.key});

  var questions = [];
  var questionsSize = 0;
  var falseOptions = [];
  var correctQuestion = Word(english: '', turkish: '');
  HashSet<Word> allOptions = HashSet<Word>();
  var questionCounter = 0;
  var correctCounter = 0;
  var falseCounter = 0;

  bool isLoading = true;

  @override
  State<MultipleChoicePage> createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  @override
  void initState() {
    super.initState();

    fetchWords();
  }

  @override
  void dispose() {
    super.dispose();
    resetData();
  }

  /*@override
  void reassemble() {
    super.reassemble();
    fetchWords();
  }*/
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade500, Colors.purple.shade800],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
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
            "Kelime Lab",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple.shade800,
        ),
        body: widget.isLoading
            ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade800, Colors.purple.shade600],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: screenHeight / 8),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade800, Colors.purple.shade600],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: screenHeight / 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Doğru: ${widget.correctCounter} Yanlış: ${widget.falseCounter} ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "${widget.questionCounter}/${widget.questionsSize}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(screenHeight / 65),
                                child: Center(
                                  child: Text(
                                    "${widget.correctQuestion.english}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight / 20,
                          ),
                          optionCard(
                              screenHeight,
                              widget.allOptions.elementAt(0).turkish,
                              correctControl,
                              questionCountControl),
                          optionCard(
                              screenHeight,
                              widget.allOptions.elementAt(1).turkish,
                              correctControl,
                              questionCountControl),
                          optionCard(
                              screenHeight,
                              widget.allOptions.elementAt(2).turkish,
                              correctControl,
                              questionCountControl),
                          optionCard(
                              screenHeight,
                              widget.allOptions.elementAt(3).turkish,
                              correctControl,
                              questionCountControl),
                        ],
                      )),
                )));
  }

  Future<void> fetchWords() async {
    await context.read<WordController>().getRandomWord();
    widget.questions = context.read<WordController>().randomWord;
    uploadQuestion();
  }

  Future<void> uploadQuestion() async {
    if (widget.questions.isEmpty) {
      return;
    }

    widget.correctQuestion = widget.questions[widget.questionCounter];
    widget.questionsSize = widget.questions.length;

    await context
        .read<WordController>()
        .getRandomOptionsWords(widget.correctQuestion.id!);
    widget.falseOptions = context.read<WordController>().options;

    widget.allOptions = HashSet();
    widget.allOptions.add(widget.correctQuestion);
    widget.allOptions.add(widget.falseOptions[0]);
    widget.allOptions.add(widget.falseOptions[1]);
    widget.allOptions.add(widget.falseOptions[2]);

    setState(() {
      widget.isLoading = false;
    });
  }

  Future<void> questionCountControl() async {
    setState(() {
      widget.questionCounter++;
    });

    if (widget.questionCounter != widget.questionsSize) {
      await uploadQuestion();
    } else {
      // Handle the case where all questions have been answered
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            trueAnswer: widget.correctCounter,
            falseAnswer: widget.falseCounter,
          ),
        ),
      ).then((value) {
        resetData();
      });
    }
  }

  void correctControl(String answer) {
    if (answer == widget.correctQuestion.turkish) {
      setState(() {
        widget.correctCounter++;
      });
    } else {
      setState(() {
        widget.falseCounter++;
      });
    }
  }

  Future<void> resetData() async {
    await Future.delayed(Duration(seconds: 1));

    if (mounted) {
      setState(() {
        setState(() {
          widget.questionCounter = 0;
          widget.correctCounter = 0;
          widget.falseCounter = 0;
        });
      });
    }
  }
}
