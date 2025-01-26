import 'package:flutter/material.dart';

GestureDetector optionCard(double screenHeight, String option, Function correctControl, Function questionCountControl) {
  {
    return GestureDetector(
      onTap: () {
        correctControl(option);
        questionCountControl();
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [Colors.white24, Colors.purple.shade300],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(padding: EdgeInsets.all(screenHeight / 65),
              child: Center(
                child: Text(
                  option, style: TextStyle(color: Colors.black, fontSize: 18),),
              ),)
        ),
      ),
    );
  }
}
