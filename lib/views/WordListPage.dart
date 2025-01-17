import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilk_proje/controller/WordController.dart';
import '../util/WordsListView.dart';
import 'WordAddPage.dart';
import 'package:provider/provider.dart';



Widget WordListPage(BuildContext context) {

  double screenWidth = MediaQuery.of(context).size.width;

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 10,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue,
                Colors.blueAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
        title: Center(
          child: Text(
            "Kelimelerini Ara",
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ))),
    body: Column(
      children: [
        Center(
            child: Image.asset("assets/images/kelimeler.png",
                width: screenWidth / 2)),
        Expanded(child: WordsListView()),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WordAddPage(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black)),
              ),
              child: Text(
                "Kelime Ekle",
                style: TextStyle(fontSize: 18, color: Colors.blueAccent),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

/*
class WordSearchDelegate extends SearchDelegate {
  @override
  Widget buildSuggestions(BuildContext context) {
    final query = this.query;
    final wordController = Provider.of<WordController>(context, listen: false);

    // Arama yapıldıkça kelimeleri filtrele
    wordController.fetchWordBySearch(query);

    return Consumer<WordController>(
      builder: (context, wordProvider, child) {
        return ListView.builder(
          itemCount: wordProvider.words.length,
          itemBuilder: (context, index) {
            final word = wordProvider.words[index];
            return ListTile(
              title: Text('${word.english} - ${word.turkish}'),
            );
          },
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();  // Sonuçlar burada gösterilebilir.
  }
}*/
