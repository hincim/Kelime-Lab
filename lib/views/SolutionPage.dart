import 'package:flutter/material.dart';

import '../controller/WordController.dart';
import 'WordCardsPage.dart';
import 'package:provider/provider.dart';


class SolutionPage extends StatelessWidget {
  const SolutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => WordCardsPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.lightBlue,
                    Colors.blueAccent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Text("Kelime Kartları",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ),
      ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent,
                    Colors.lightBlue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Text("Çoktan Seçmeli Sorular",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        )

      ],
    );
  }
}
