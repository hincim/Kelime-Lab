import 'package:flutter/material.dart';

import '../model/IndicatorModel.dart';
class IndicatorController extends ChangeNotifier {
  final IndicatorModel _indicatorModel;

  IndicatorController(this._indicatorModel);

  bool get isIndicatorVisible => _indicatorModel.isIndicatorVisible;

  void visible() {
    _indicatorModel.visible();
    notifyListeners(); // View'i güncelle
  }
  void invisible() {
    _indicatorModel.invisible();
    notifyListeners(); // View'i güncelle
  }
}