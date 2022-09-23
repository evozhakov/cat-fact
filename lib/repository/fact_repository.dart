import 'dart:developer' as dev;
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/constants/app_strings.dart';
import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/models/fact/get_fact_model.dart';
import 'package:cats_fact/models/history/box_history.dart';
import 'package:cats_fact/models/image/image_model.dart';
import 'package:cats_fact/presentation/swipe_card.dart';

class FactRepository {
  List<SwipeCard> cards = [];
  List<CardModel> catFacts = [];
  final translator = GoogleTranslator();
  final Dio dio = Dio();
  final DateTime now = DateTime.now();
  final box = Hive.box<SavedHistory>('history');

  void swipe(
    int index,
    AppinioSwiperDirection direction,
  ) {
    dev.log(
      AppStrings.swiped + direction.name,
    );
  }

  void unswipe(
    bool unswiped,
  ) {
    if (unswiped) {
      dev.log(
        AppStrings.success,
      );
    } else {
      dev.log(
        AppStrings.fail,
      );
    }
  }

  Future<void> loadCards() async {
    for (CardModel catFact in catFacts) {
      cards.add(
        SwipeCard(
          catFact: catFact,
        ),
      );
    }
  }

  Future<void> saveFact(CardModel fact) async {
    SavedHistory save = SavedHistory(
      date: fact.date,
      fact: fact.fact,
      id: fact.id,
    );
    Box box = await Hive.openBox<SavedHistory>('history');
    bool isContains = box.values.any(
      (element) => element.id.toString().contains(
            fact.id.toString(),
          ),
    );
    !isContains
        ? box.add(
            save,
          )
        : null;
  }

  Future<void> addCards(context) async {
    for (int i = 1; i <= 5; i++) {
      final image = await getImage();
      final fact = await getFact(context);
      final date = DateFormat('y/M/d HH:mm')
          .format(
            now,
          )
          .toString();
      final id = Random().nextInt(10000);
      catFacts.add(
        CardModel(
          date: date,
          fact: fact,
          image: image,
          id: id,
        ),
      );
    }
    catFacts.add(
      CardModel(),
    );
  }

  Future<String> getFact(BuildContext context) async {
    final lang = AppLocalizations.of(context)!.localLan;
    final factEn = await RestFact(dio).getFact();
    final fact = await translator.translate(factEn.fact!, to: lang);
    return fact.text;
  }

  Future<String> getImage() async {
    final idImage = await RestImage(dio).getImage();
    final ulrImage = AppStrings.baseUrlImage + idImage.url.toString();
    return ulrImage;
  }

  List<SavedHistory> factHistory =
      Hive.box<SavedHistory>('history').values.toList();

  void clearBox() {
    box.clear();
  }
}
