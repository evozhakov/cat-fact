import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';
import 'package:cats_fact/constants/app_strings.dart';
import 'package:cats_fact/repository/repository_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountFactWidget extends StatelessWidget {
  const CountFactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select((ServiceBloc bloc) => bloc.state.countFact);
    return DropdownButton(
      value: count,
      onChanged: (value) => settingsRepository.changeCountFact(context, value!),
      items: AppStrings.listInt
          .map(
            (e) => DropdownMenuItem<int>(
              value: e,
              child: Text(
                e.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
