import 'package:cats_fact/models/fact/get_fact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FactPage extends StatelessWidget {
  final ModelFact value;

  const FactPage({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    dynamic customWidth = MediaQuery.of(context).size.width / 1.1;
    dynamic customHeigh = MediaQuery.of(context).size.height / 2.2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Container(
                height: customHeigh,
                width: customWidth,
                decoration: BoxDecoration(
                  border: Border.all(width: 5),
                ),
                child: Image.network(
                  value.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator.adaptive(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.fact,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                value.data,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: customWidth,
                child: Text(
                  value.fact,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 19),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
