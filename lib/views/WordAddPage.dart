import 'package:flutter/material.dart';
import 'package:kelime_lab/cubit/TranslateCubit.dart';
import 'package:kelime_lab/model/Word.dart';
import 'package:kelime_lab/util/WordAddBlocBuilder.dart';
import 'package:provider/provider.dart';
import 'package:kelime_lab/controller/TrueFalseController.dart';
import '../controller/WordController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordAddPage extends StatelessWidget {
  WordAddPage({super.key});

  final _textEditingControllerTr = TextEditingController();
  final _textEditingControllerEng = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<SwappedController>(
      builder: (context, swappedController, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.blueAccent,
          // Set background color for SafeArea
          body: Column(
            // Use Column for vertical stacking
            children: [
              Expanded(
                // Allow remaining space to grow
                child: Container(), // Empty container for flexibility
              ),
              Center(
                // Center the card vertically
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Prevent excessive padding
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100, left: 8),
                      child: Text(
                        "Welcome\nBack",
                        style: TextStyle(
                          fontSize: 32.0,
                          // Adjust font size for better hierarchy
                          color: Colors.white, // Use black for better contrast
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                      ),
                      color: Colors.white,
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 200.0, left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8.0),
                            // Add spacing between title and fields
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(children: [
                                    AnimatedSwitcher(
                                      duration: Duration(seconds: 1),
                                      transitionBuilder: (child, animation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                      child: swappedController.isSwapped
                                          ? TextField(
                                              key: ValueKey('turkish'),
                                              controller:
                                                  _textEditingControllerTr,
                                              // Unique key for the TextField
                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: "Türkçe",
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    const EdgeInsets.all(16.0),
                                              ),
                                            )
                                          : TextField(
                                              key: ValueKey('english'),
                                              controller:
                                                  _textEditingControllerEng,
                                              // Unique key for the TextField
                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: "İngilizce",
                                                border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                color: Colors.blue,
        ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    const EdgeInsets.all(16.0),
                                              ),
                                            ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    AnimatedSwitcher(
                                      duration: Duration(seconds: 1),
                                      transitionBuilder: (child, animation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                      child: swappedController.isSwapped
                                          ? TextField(
                                              key: ValueKey('english_2'),
                                              controller:
                                                  _textEditingControllerEng,
                                              // Unique key for the TextField
                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: "İngilizce",
                                                border: OutlineInputBorder(
        borderSide: BorderSide(
        color: Colors.blue,
        ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    const EdgeInsets.all(16.0),
                                              ),
                                            )
                                          : TextField(
                                              key: ValueKey('turkish_2'),
                                              controller:
                                                  _textEditingControllerTr,
                                              // Unique key for the TextField
                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: "Türkçe",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    const EdgeInsets.all(16.0),
                                              ),
                                            ),
                                    ),
                                  ])),
                                  const SizedBox(width: 10.0),
                                  // Add spacing between input and button
                                  Consumer<SwappedController>(
                                    builder: (context, iconController, child) {
                                      return AnimatedSwitcher(
                                        duration: Duration(milliseconds: 500),
                                        transitionBuilder: (child, animation) {
                                          return RotationTransition(
                                            turns: Tween<double>(
                                              begin: 0.0,
                                              end: 0.5,
                                            ).animate(animation),
                                            child: child,
                                          );
                                        },
                                        child: IconButton(
                                          key: ValueKey(
                                              iconController.isSwapped),
                                          onPressed: () {
                                            swappedController
                                                .toggleVisibility();
                                            _textEditingControllerTr.clear();
                                            _textEditingControllerEng.clear();
                                          },
                                          icon: SvgPicture.asset(
                                            color: swappedController.isSwapped
                                                ? Colors.blue.shade800
                                                : Colors.blue.shade300,
                                            'assets/icons/repeat.svg',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            if (context
                                .watch<SearchWidgetController>()
                                .isSearch)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ), // Progress bar

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade300,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 40.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () async {
                                  context
                                      .read<SearchWidgetController>()
                                      .isToSearchTrue();

                                  final english =
                                      _textEditingControllerEng.text.trim();
                                  final turkish =
                                      _textEditingControllerTr.text.trim();

                                  try {
                                    if (swappedController.isSwapped &&
                                        turkish.isNotEmpty) {
                                      await context
                                          .read<TranslateCubit>()
                                          .getData(turkish, "tr-en");
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return WordAddBlocBuilder(
                                              textEditingControllerEng:
                                                  _textEditingControllerEng,
                                              screenHeight: screenHeight,
                                              isSwapped:
                                                  swappedController.isSwapped);
                                        },
                                      );
                                    } else if (!swappedController.isSwapped &&
                                        english.isNotEmpty) {
                                      await context
                                          .read<TranslateCubit>()
                                          .getData(english, "en-tr");
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return WordAddBlocBuilder(
                                              textEditingControllerTr:
                                                  _textEditingControllerTr,
                                              screenHeight: screenHeight,
                                              isSwapped:
                                                  swappedController.isSwapped);
                                        },
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          duration: Duration(milliseconds: 500),
                                              content: Text(
                                                  'Aramak için kelime girin')));
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                  duration: Duration(milliseconds: 500),
                                          content:
                                              Text('Hata: ${e.toString()}')),
                                    );
                                  } finally {
                                    context
                                        .read<SearchWidgetController>()
                                        .isToSearchFalse();
                                  }
                                },
                                child: Text(
                                  "Ara",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 40.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    final english = _textEditingControllerEng
                                        .text
                                        .trim()
                                        .toLowerCase();
                                    final turkish = _textEditingControllerTr
                                        .text
                                        .trim()
                                        .toLowerCase();

                                    if (english.isNotEmpty &&
                                        turkish.isNotEmpty) {
                                      try {
                                        final word = Word(
                                            english: english, turkish: turkish);
                                        Provider.of<WordController>(context,
                                                listen: false)
                                            .addWord(word)
                                            .then(
                                                (_) => Navigator.pop(context, true));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              duration: Duration(milliseconds: 500),
                                              content: Text('Kelime eklendi')),
                                        );
                                        _textEditingControllerTr.clear();
                                        _textEditingControllerEng.clear();
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                    duration: Duration(milliseconds: 500),
                                              content: Text(
                                                  'Hata: ${e.toString()}')),
                                        );
                                      }
                                    } else {
                                      // Alanlar boş bırakılmışsa uyarı göster
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                    duration: Duration(milliseconds: 500),
                                            content: Text(
                                                'Lütfen tüm alanları doldurun!')),
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Kaydet",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
