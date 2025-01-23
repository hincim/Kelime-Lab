import 'package:flutter/material.dart';
import 'package:kelime_lab/views/MultipleChoicePage.dart';

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
              if(context.read<WordController>().words.length <4){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text("En az 1 kelime ekleyin")));
                return;
              }
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
            child: InkWell(
              onTap: (){
                if(context.read<WordController>().words.length <4){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text("En az 4 kelime ekleyin")));
                  return;
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) => MultipleChoicePage()));
              },
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
          ),
        )

      ],
    );
  }
}
