// ignore_for_file: use_build_context_synchronously

part of 'repository_imports.dart';

class FactRepository {
  List<SwipeCard> cards = [];
  List<SwipeCard> firstCard = [];
  List<FactModel> catFacts = [];
  List<FactModel> emptyFact = [];
  final _translator = GoogleTranslator();
  final Dio _dio = Dio();

  final Duration _duration = const Duration(milliseconds: 500);

  Future<void> emitCards({
    required BuildContext context,
    required bool isFirs,
    required Emitter<FactState> emit,
  }) async {
    await addCards(
      context,
      isFirs,
    ).whenComplete(() => cardRrepository.loadCards(isFirs)).whenComplete(
          () => emit(
            FactState(
              swipeCard: cards,
              firstSwipeCard: firstCard,
            ),
          ),
        );
  }

  Future<void> emitForAnimation({
    required Emitter<FactState> emit,
    required FactState state,
  }) async {
    await Future.delayed(_duration).whenComplete(
      () => emit(
        FactState(
            swipeCard: state.swipeCard,
            animation: !state.animation,
            firstSwipeCard: state.firstSwipeCard),
      ),
    );
  }

  Future<void> addCards(BuildContext context, bool isFirs) async {
    final int count = context.read<ServiceBloc>().state.countFact;

    isFirs
        ? emptyFact.add(const FactModel())
        : {
            factRepository.cards.clear(),
            factRepository.catFacts.clear(),
          };
    for (int i = 1; i <= count; i++) {
      String image = await getImage();
      String fact = await getFact(context);
      String date = DateFormat('y/M/d HH:mm').format(DateTime.now()).toString();
      String id = Random().nextInt(10000).toString();
      catFacts.add(
        FactModel(
          date: date,
          fact: fact,
          image: image,
          id: id,
        ),
      );
    }
  }

  Future<String> getFact(BuildContext context) async {
    final lang = AppLocalizations.of(context)!.localLan;
    final factEn = await RestFact(_dio).getFact();
    final fact = await _translator.translate(factEn.fact!, to: lang);
    return fact.text;
  }

  Future<String> getImage() async {
    final idImage = await RestImage(_dio).getImage();
    final ulrImage = AppStrings.baseUrlImage + idImage.url.toString();
    return ulrImage;
  }
}
