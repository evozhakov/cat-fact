// ignore_for_file: depend_on_referenced_packages

import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/models/fact/get_fact_model.dart';
import 'package:cats_fact/models/image/image_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dio/dio.dart';

class GetFactValues extends Bloc<BlocFact, ModelFact> {
  final translator = GoogleTranslator();

  GetFactValues(context) : super(ModelFact.initial()) {
    on(
      (event, emit) async {
        emit(ModelFact.loading());

        final lang = AppLocalizations.of(context)!.localLan;
        final fact = getFact();
        final image = getImage();

        emit(
          ModelFact.loaded(
            data: DateFormat('y/M/d HH:mm').format(DateTime.now()).toString(),
            fact: await fact.then(
              (value) async {
                final translation =
                    await translator.translate(value.fact!, to: lang);
                return translation.text;
              },
            ),
            image:
                await image.then((value) => 'https://cataas.com${value.url}'),
          ),
        );
      },
    );
  }

  Future<RandomFact> getFact() async {
    final response = await Dio(BaseOptions(baseUrl: 'https://catfact.ninja'))
        .get<Map<String, dynamic>>('/fact');
    final json = response.data!;
    final fact = RandomFact.fromJson(json);
    return fact;
  }

  Future<RandomImage> getImage() async {
    final response = await Dio(BaseOptions(baseUrl: 'https://cataas.com'))
        .get<Map<String, dynamic>>('/cat?json=true');
    final json = response.data!;
    final image = RandomImage.fromJson(json);

    return image;
  }
}
