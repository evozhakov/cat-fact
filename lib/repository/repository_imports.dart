//packages
import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/translator.dart';
import 'package:hive_flutter/hive_flutter.dart';

//lib

import 'package:cats_fact/ui/widgets/card_fact/swipe_card.dart';
import 'package:cats_fact/constants/app_strings.dart';
import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/models/fact/request_fact_model.dart';
import 'package:cats_fact/models/image/request_image_model.dart';
import 'package:cats_fact/models/history/box_history.dart';
import 'package:cats_fact/utils/utils.dart';
import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';
import 'package:cats_fact/models/settings/settings_model.dart';

//part
part 'card_repository.dart';
part 'hive_box_repository.dart';
part 'fact_repository.dart';
part 'settings_repository.dart';

final factRepository = FactRepository();
final cardRrepository = CardRepository();
final hiveFactRepository = HiveFactRepository();
final settingsRepository = SettingsRepository();
