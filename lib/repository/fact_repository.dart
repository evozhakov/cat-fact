part of 'repository_imports.dart';



class FactRepository {
  List<SwipeCard> cards = [];
  List<CardModel> catFacts = [];
  final translator = GoogleTranslator();
  final Dio dio = Dio();
  final DateTime now = DateTime.now();

  Future<void> emitCards({
    required BuildContext context,
    required bool isFirs,
    required Emitter<FactState> emit,
  }) async {
    await addCards(
      context,
      isFirs,
    )
        .whenComplete(
          () => cardRrepository.loadCards(),
        )
        .whenComplete(
          () => emit(
            FactState(swipeCard: cards),
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
            const CardModel(),
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
