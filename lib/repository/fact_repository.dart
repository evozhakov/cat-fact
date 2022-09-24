import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/presentation/cat_fact.dart';
import 'package:cats_fact/constants/app_strings.dart';
import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/models/fact/get_fact_model.dart';
import 'package:cats_fact/models/image/image_model.dart';
import 'package:cats_fact/presentation/swipe_card.dart';

class FactRepository {
  List<SwipeCard> cards = [];
  List<CardModel> catFacts = [];
  final translator = GoogleTranslator();
  final Dio dio = Dio();
  final DateTime now = DateTime.now();

  Future<void> emitCard({context, isFirs, emit}) async {
    await addCards(
      context,
      isFirs,
    )
        .whenComplete(
          () => cardRrepository.loadCards(),
        )
        .whenComplete(
          () => emit(
            cards,
          ),
        );
  }

  Future<void> addCards(context, bool isFirs) async {
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
    isFirs
        ? catFacts.add(
            CardModel(),
          )
        : null;
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
}
