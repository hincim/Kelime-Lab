class IndicatorModel {
  bool isIndicatorVisible;

  IndicatorModel({this.isIndicatorVisible = false});

  void invisible(){
    isIndicatorVisible = false;

  }
  void visible(){
    isIndicatorVisible = true;

  }
}
