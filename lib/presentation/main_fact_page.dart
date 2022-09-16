import 'package:cats_fact/bloc/get_fact.dart';
import 'package:cats_fact/main.dart';
import 'package:cats_fact/models/fact/get_fact_model.dart';
import 'package:cats_fact/models/history/box_history.dart';
import 'package:cats_fact/presentation/fact_page.dart';
import 'package:cats_fact/presentation/fact_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CatFacts extends StatelessWidget {
  const CatFacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.book,
              color: Colors.black,
            ),
            onPressed: () => showBarModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: Colors.white,
              builder: (context) => const ModalInsideModal(),
            ),
          ),
        ],
        centerTitle: true,
        title: const FaIcon(
          FontAwesomeIcons.cat,
          color: Colors.black,
        ),
      ),
      body: BlocProvider<GetFactValues>(
        create: (context) => GetFactValues(context)
          ..add(
            BlocFact(),
          ),
        child: BlocBuilder<GetFactValues, ModelFact>(
          builder: (context, value) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                FactPage(
                  value: value,
                ),
                value.isLoading
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Center(
                            child: CircularProgressIndicator.adaptive()),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            onPressed: (() async {
                              box.add(
                                SavedHistory(
                                    date: value.data, fact: value.fact),
                              );

                             
                              BlocProvider.of<GetFactValues>(context)
                                  .add(BlocFact());
                            
                            }),
                            child: Text(
                              AppLocalizations.of(context)!.more,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 10)
                        ],
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}
