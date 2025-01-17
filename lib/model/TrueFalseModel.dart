

class TrueFalseModel {
  bool isPasswordVisible;
  bool isSwapped;
  bool isTextField;
  bool isDropped;

  TrueFalseModel({this.isPasswordVisible = true, this.isSwapped = false, this.isTextField = false, this.isDropped = false});

  void isPasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  void isToSwapped() {
    isSwapped = !isSwapped;
  }

  void isToTextField() {
    isTextField = !isTextField;
  }

  void isToDropped() {
    isDropped = !isDropped;
  }
}
