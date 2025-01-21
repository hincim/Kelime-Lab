

class TrueFalseModel {
  bool isPasswordVisible;
  bool isSwapped;
  bool isTextField;
  bool isDropped;
  bool isSearch;
  bool isClicked;

  TrueFalseModel({this.isPasswordVisible = true, this.isSwapped = false, this.isTextField = false, this.isDropped = true,
    this.isSearch = false, this.isClicked = false});

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

  void isTrue() {
    isSearch = true;
  }

  void isFalse() {
    isSearch = false;
  }

  void isToClicked() {
    isClicked = !isClicked;
  }
}
