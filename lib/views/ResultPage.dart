import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, required this.trueAnswer, required this.falseAnswer});

  final int trueAnswer;
  final int falseAnswer;

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade800, Colors.purple.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        )),
        title: Text(
          "Sonuç",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade800,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade500, Colors.purple.shade800],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Doğru Sayısı: $trueAnswer",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(height: 10),
              Text("Yanlış Sayısı: $falseAnswer",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(height: 70),
              Text(
                  "Başarı yüzdesi: %${(trueAnswer * 100 ~/ (trueAnswer + falseAnswer))}",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(height: screenHeight / 10),
            ],
          ),
        ),
      ),
    );
  }
}
