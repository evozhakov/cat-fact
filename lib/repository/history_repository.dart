import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/fact/fact_model.dart';
import '../utils/utils.dart';

class HistoryRepository {
  final historyCollectionRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('history');
  Future<void> saveFact(FactModel fact) async {
    historyCollectionRef.doc(fact.id).set(fact.toJson());
  }

  Future<void> deleteFact(FactModel fact) async {
    historyCollectionRef.doc(fact.id).delete();
  }

  void removeFact(FactModel fact, AppLocalizations text) {
    deleteFact(fact);

    Utils.showSnackBar(
      text.factDeleted,
      labelButton: text.cancel,
      onTap: () {
        saveFact(fact);
      },
    );
  }

  Stream<List<FactModel>> facts() {
    return historyCollectionRef
        .snapshots()
        .map((snapshot) => toDomain(snapshot.docs));
  }

  List<FactModel> toDomain(List<DocumentSnapshot> docs) {
    return docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return FactModel.fromJson(data);
    }).toList();
  }

  void clearBox(AppLocalizations text) async {
    final querySnapshot = await historyCollectionRef.get();
    final facts = querySnapshot.docs
        .map(
          (e) => FactModel.fromJson(e.data()),
        )
        .toList();

    if (facts.isEmpty) {
      Utils.showSnackBar(text.noFacts);
    } else {
      for (FactModel fact in facts) {
        deleteFact(fact);
      }

      Utils.showSnackBar(
        text.factsRemoved,
        labelButton: text.cancel,
        onTap: () {
          for (FactModel fact in facts) {
            saveFact(fact);
          }
        },
      );
    }
  }
}
