//packages
import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';
import 'package:hive_flutter/hive_flutter.dart';

//lib

import 'package:cats_fact/presentation/card_fact/swipe_card.dart';
import 'package:cats_fact/presentation/fact_history.dart';
import 'package:cats_fact/presentation/settings.dart';
import 'package:cats_fact/constants/app_strings.dart';
import 'package:cats_fact/models/fact_model.dart';
import 'package:cats_fact/constants/app_colors.dart';
import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/models/fact/request_fact_model.dart';
import 'package:cats_fact/models/image/request_image_model.dart';
import 'package:cats_fact/models/history/box_history.dart';

//part
part 'card_repository.dart';
part 'hive_box_repository.dart';
part 'fact_repository.dart';

FactRepository factRepository = FactRepository();
CardRepository cardRrepository = CardRepository();
HiveRepository hiveRepository = HiveRepository();
//test comit to view work
