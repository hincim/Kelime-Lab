import 'package:flutter/cupertino.dart';

class CounterController extends ChangeNotifier{


  int _counter = 0;
  int get counter => _counter;

  int _falseAnswer = 0;
  int get falseAnswer => _falseAnswer;

  int _trueAnswer = 0;
  int get trueAnswer => _trueAnswer;

  void increment(){
    _counter++;
    notifyListeners();
  }

  void falseToAnswer(){
    _falseAnswer++;
    notifyListeners();
  }

  void trueToAnswer(){
    _trueAnswer++;
    notifyListeners();
  }
  void reset(){
    _counter = 0;
    _falseAnswer = 0;
    _trueAnswer = 0;
    notifyListeners();
  }
}