import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/TranslateCubit.dart';

class WordAddBlocBuilder extends StatelessWidget {
  final TextEditingController? textEditingControllerEng;
  final TextEditingController? textEditingControllerTr;
  final bool? isSwapped;
  final double screenHeight;

  const WordAddBlocBuilder({
    super.key,
    required this.isSwapped,
    this.textEditingControllerEng,
    this.textEditingControllerTr,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateCubit, List<String>>(
      builder: (context, list) {
        if (list.isEmpty) {
          return AlertDialog(
            title: Text("Sonuçlar", style: TextStyle(color: Colors.blue.shade800)),
            content: Text("Çeviri bulunamadı", style: TextStyle(color: Colors.blue.shade800)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Kapat", style: TextStyle(color: Colors.blue.shade800)),
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: Text("Bulunan Kelimeler", style: TextStyle(color: Colors.blue.shade800)),
            content: SizedBox(
              width: double.maxFinite,
              height: screenHeight / 4,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    selected: true,
                    selectedColor: Colors.blue.shade800,
                    title: Text(
                      list[index],
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      if (isSwapped!) {
                        textEditingControllerEng!.text = list[index].toLowerCase();
                      } else {
                        textEditingControllerTr!.text = list[index].toLowerCase();
                      }
                      Navigator.pop(context);
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Kapat", style: TextStyle(color: Colors.blue.shade800)),
              ),
            ],
          );
        }
      },
    );
  }
}
