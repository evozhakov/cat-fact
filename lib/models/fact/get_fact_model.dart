class BlocFact {}

class ModelFact {
  final String image;
  final String data;
  final String fact;
  final bool isLoading;

  ModelFact._({
    this.data = '',
    this.fact = '',
    this.image = 'https://cataas.com/cat',
    this.isLoading = true,
  });

  ModelFact.initial() : this._();

  ModelFact.loading() : this._();

  ModelFact.loaded({
    required String data,
    required String fact,
    required String image,
  }) : this._(
          data: data,
          fact: fact,
          image: image,
          isLoading: false,
        );
}
