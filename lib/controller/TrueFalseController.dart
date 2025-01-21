import 'package:flutter/material.dart';

import '../model/TrueFalseModel.dart';


// Şifre 1 için Controller
class PasswordController1 extends ChangeNotifier {
  final TrueFalseModel _passwordModel;

  PasswordController1(this._passwordModel);

  bool get isPasswordVisible => _passwordModel.isPasswordVisible;

  void toggleVisibility() {
    _passwordModel.isPasswordVisibility();
    notifyListeners(); // View'i güncelle
  }
}

// Şifre 2 için Controller
class PasswordController2 extends ChangeNotifier {
  final TrueFalseModel _passwordModel;

  PasswordController2(this._passwordModel);

  bool get isPasswordVisible => _passwordModel.isPasswordVisible;

  void toggleVisibility() {
    _passwordModel.isPasswordVisibility();
    notifyListeners();
  }
}

class PasswordControllerLoginPage extends ChangeNotifier {
  final TrueFalseModel _passwordModel;

  PasswordControllerLoginPage(this._passwordModel);

  bool get isPasswordVisible => _passwordModel.isPasswordVisible;

  void toggleVisibility() {
    _passwordModel.isPasswordVisibility();
    notifyListeners();
  }
}

class SwappedController extends ChangeNotifier {
  final TrueFalseModel _trueFalseModel;

  SwappedController(this._trueFalseModel);

  bool get isSwapped => _trueFalseModel.isSwapped;

  void toggleVisibility() {
    _trueFalseModel.isToSwapped();
    notifyListeners();
  }
}

class TextFieldController extends ChangeNotifier {
  final TrueFalseModel _trueFalseModel;

  TextFieldController(this._trueFalseModel);

  bool get isTextField => _trueFalseModel.isTextField;

  void toggleVisibility() {
    _trueFalseModel.isToTextField();
    notifyListeners();
  }
}

class DroppedController extends ChangeNotifier {
  final TrueFalseModel _trueFalseModel;

  DroppedController(this._trueFalseModel);

  bool get isDropped => _trueFalseModel.isDropped;

  void toggleVisibility() {
    _trueFalseModel.isToDropped();
    notifyListeners();
  }
}

class SearchWidgetController extends ChangeNotifier {
  final TrueFalseModel _trueFalseModel;

  SearchWidgetController(this._trueFalseModel);

  bool get isSearch => _trueFalseModel.isSearch;

  void isToSearchTrue() {
    _trueFalseModel.isTrue();
    notifyListeners();
  }

  void isToSearchFalse() {
    _trueFalseModel.isFalse();
    notifyListeners();
  }
}


class ClickedController extends ChangeNotifier {
  final TrueFalseModel _trueFalseModel;

  ClickedController(this._trueFalseModel);

  bool get isClicked => _trueFalseModel.isClicked;

  void toggleVisibility() {
    _trueFalseModel.isToClicked();
    notifyListeners();
  }
}
