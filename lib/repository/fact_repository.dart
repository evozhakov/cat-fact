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
      String image = await getImage(context);
      String fact = await getFact(context);
      String date = DateFormat('y/M/d HH:mm').format(DateTime.now()).toString();
      String id = const Uuid().v4();
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
    final locale = context.read<ServiceBloc>().state.locale;
    final factEn = await RestFact(_dio).getFact();
    final fact = await _translator.translate(factEn.fact!, to: locale);
    return fact.text;
  }

  Future<String> getImage(BuildContext context) async {
    final apiCataasWork = context.read<ServiceBloc>().state.apiCataasWork;

    if (apiCataasWork) {
      final image = await _mainImageSourse(context);
      return image;
    } else {
      final image = await _alternativeImageSourse();
      return image;
    }
  }

  //refactor this code ⇩

  Future<String> _mainImageSourse(BuildContext context) async {
    try {
      final responseData = await _dio.get('https://cataas.com/cat?json=true');

      String url = jsonDecode(json.encode(responseData.data))["url"];

      url = AppStrings.baseUrlImage + url;

      return url;
    } on DioError {
      context.read<ServiceBloc>().add(CataasNotWorkEvent());
      Utils.showSnackBar(
          'https://cataas.com does not work trying to connect to alternative services, please wait'); //to local
      final image = await _alternativeImageSourse();
      return image;
    }
  }

  Future<String> _alternativeImageSourse() async {
    final responseData = await _dio.get('https://aws.random.cat/meow');

    final ulr = jsonDecode(json.encode(responseData.data))["file"] as String;

    return ulr;
  }

  Future<void> createImageWithText(BuildContext context,
      TextEditingController controller, GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      final text = controller.text.trim();

      final responseData =
          await _dio.get('https://cataas.com/cat/says/$text?json=true');

      String url = jsonDecode(json.encode(responseData.data))["url"];

      url = AppStrings.baseUrlImage + url;

      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: EdgeInsets.zero,
            content: RandomImageWidget(ulr: url),
          );
        },
      );
    }
  }
}
