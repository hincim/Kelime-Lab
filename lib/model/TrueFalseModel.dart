

class TrueFalseModel {
  bool isPasswordVisible;
  bool isSwapped;

  TrueFalseModel({this.isPasswordVisible = true, this.isSwapped = false});

  void isPasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  void isToSwapped() {
    isSwapped = !isSwapped;
  }
}
