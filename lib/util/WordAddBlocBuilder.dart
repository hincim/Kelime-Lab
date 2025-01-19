import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../controller/TrueFalseController.dart';
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
          context.read<SearchWidgetController>().isToSearchFalse();
          return AlertDialog(
            title: Text("Sonuçlar"),
            content: Text("Veri bulunamadı."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Kapat"),
              ),
            ],
          );
        } else {
          context.read<SearchWidgetController>().isToSearchFalse();
          return AlertDialog(
            title: Text("Bulunan Kelimeler"),
            content: SizedBox(
              width: double.maxFinite,
              height: screenHeight / 4,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(list[index]),
                    onTap: () {
                      isSwapped! ? textEditingControllerEng!.text = list[index].toLowerCase() : textEditingControllerTr!.text = list[index].toLowerCase();
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Kapat"),
              ),
            ],
          );
        }
      },
    );
  }
}
