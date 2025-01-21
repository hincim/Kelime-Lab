import 'package:flutter/material.dart';
import 'package:ilk_proje/controller/TrueFalseController.dart';
import '../controller/WordController.dart';
import '../util/WordsListView.dart';
import 'WordAddPage.dart';
import 'package:provider/provider.dart';

class WordListPage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  WordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<TextFieldController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: -3.0,
                  child: child,
                ),
              ),
              child: controller.isTextField
                  ? Padding(
                      key: ValueKey('TextField'),
                      padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        autofocus: true,
                        onChanged: (value) {
                          context
                              .read<WordController>()
                              .fetchWordBySearch(value);
                        },
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          hintText: "Kelime ara",
                          suffixIcon: IconButton(
                            onPressed: () {
                              context
                                  .read<TextFieldController>()
                                  .toggleVisibility();
                              context.read<WordController>().fetchWords();
                            },
                            icon: Icon(Icons.cancel),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    )
                  : AppBar(
                      key: ValueKey('AppBar'),
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
                            context
                                .read<TextFieldController>()
                                .toggleVisibility();
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      title: Center(
                        child: Text(
                          "Kelime Lab",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      leading: IconButton(
                        onPressed: () {
                          context.read<WordController>().deleteAllWords();
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ),
          body: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/kelimeler.png",
                  width: screenWidth / 2,
                ),
              ),
              Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                color: Colors.blueAccent.shade400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "İngilizce",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      Text("Türkçe",
                          style: TextStyle(fontSize: 17, color: Colors.white)),
                    ],
                  ),
                ),
              ),
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
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Text(
                      "Kelime Ekle",
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
