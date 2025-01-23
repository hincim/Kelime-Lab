import 'package:flutter/material.dart';
import 'package:kelime_lab/controller/BottomNavigationController.dart';
import 'package:kelime_lab/controller/TrueFalseController.dart';
import 'package:kelime_lab/controller/WordController.dart';
import 'package:kelime_lab/cubit/TranslateCubit.dart';
import 'package:kelime_lab/views/ContactPage.dart';
import 'package:kelime_lab/views/ToolsPage.dart';
import 'package:kelime_lab/views/SolutionPage.dart';
import 'package:kelime_lab/views/WordListPage.dart';
import 'package:provider/provider.dart';


class Mainpage extends StatelessWidget {
  Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WordController>().fetchWords();

    final pages = [WordListPage(), SolutionPage(), ToolsPage(context),ContactPage()];

    return SafeArea(
      child: Scaffold(
          body: Consumer<BottomNavigationController>(
            builder: (context, controller, child) {
              return pages[controller.page];
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 100,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blueAccent,
              currentIndex: context.watch<BottomNavigationController>().page,
              onTap: (index) => _onItemTapped(
                  index, context.read<BottomNavigationController>()),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.blueAccent,
                    ),
                    label: "Anasayfa"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.deblur,
                      color: Colors.blueAccent,
                    ),
                      label: "Alıştırma Yap"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu, color: Colors.blueAccent),
                    label: "Araçlar"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.call, color: Colors.blueAccent),
                    label: "İletişim"),
              ])),
    );
  }
}

void _onItemTapped(int index, BottomNavigationController controller) {
  switch (index) {
    case 0:
      controller.firstToPage();
      break;
    case 1:
      controller.secondToPage();
      break;
    case 2:
      controller.thirdToPage();
      break;
    case 3:
      controller.fourthToPage();
      break;
  }
}
