import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/TranslateController.dart';

class TranslateCubit extends Cubit<List<String>>{

  TranslateCubit():super(<String>[]);

  Future<void> getData(String search, String translate) async{
    final data = await TranslateController.getTurkishTranslations(search, translate);
    emit(data);
  }
}