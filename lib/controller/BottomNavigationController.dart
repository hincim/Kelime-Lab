import 'package:flutter/material.dart';
import 'package:kelime_lab/model/BottomNavigationModel.dart';

class BottomNavigationController extends ChangeNotifier {
  final BottomNavigationModel _bottomNavigationModel;

  BottomNavigationController(this._bottomNavigationModel);

  int get page => _bottomNavigationModel.page;

  void firstToPage() {
    _bottomNavigationModel.firstPage();
    notifyListeners(); // View'i güncelle
  }

  void secondToPage() {
    _bottomNavigationModel.secondPage();
    notifyListeners(); // View'i güncelle
  }

  void thirdToPage() {
    _bottomNavigationModel.thirdPage();
    notifyListeners(); // View'i güncelle
  }

  void fourthToPage() {
    _bottomNavigationModel.fourthPage();
    notifyListeners(); // View'i güncelle
  }
}