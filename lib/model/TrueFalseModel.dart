

class TrueFalseModel {
  bool isPasswordVisible;
  bool isSwapped;
  bool isTextField;

  TrueFalseModel({this.isPasswordVisible = true, this.isSwapped = false, this.isTextField = false});

  void isPasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  void isToSwapped() {
    isSwapped = !isSwapped;
  }

  void isToTextField() {
    isTextField = !isTextField;
  }
}
