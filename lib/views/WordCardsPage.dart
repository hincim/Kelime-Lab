import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelime_lab/controller/TrueFalseController.dart';
import 'package:kelime_lab/controller/WordController.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WordCardsPage extends StatelessWidget {
  WordCardsPage({super.key});
  PageController? _pageController;
  final FlutterTts _flutterTts = FlutterTts();

  Future<void> _saveLastViewedCard(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastViewedCard', index);
  }

  Future<int> _loadLastViewedCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('lastViewedCard') ?? 0;
  }

  Future<void> _speak(String text, bool isClicked) async {
    await _flutterTts.setLanguage(isClicked ? "en-US":"tr-TR");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: _loadLastViewedCard(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        int initialPage = snapshot.data!;
        _pageController = PageController(initialPage: initialPage);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
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
            elevation: 10,
            backgroundColor: Colors.white,
            title: Text(
              "Kelime Kartları",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Consumer<WordController>(
            builder: (context, wordController, child) {
              return PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  _saveLastViewedCard(index); // Son görüntülenen kartı kaydediyoruz
                },
                itemCount: wordController.words.length,
                itemBuilder: (context, index) {
                  final word = wordController.words[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<ClickedController>(
                      builder: (context, clickedController, child) {
                        return GestureDetector(
                          onTap: () {
                            clickedController.toggleVisibility();
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
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
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 400), // Animasyon süresi
                                  transitionBuilder: (Widget child, Animation<double> animation) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: Offset(0.0, 1.0), // Aşağıdan yukarıya
                                        end: Offset(0.0, 0.0),   // Orijinal pozisyon
                                      ).animate(animation),
                                      child: FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: Column(
                                    key: ValueKey<bool>(clickedController.isClicked), // Benzersiz anahtar
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            clickedController.isClicked ? word.english : word.turkish,
                                            style: TextStyle(
                                              fontSize: 27,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      IconButton(
                                        onPressed: () {
                                          _speak(clickedController.isClicked ? word.english: word.turkish, clickedController.isClicked);
                                        },
                                        icon: Icon(
                                          Icons.volume_up,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
