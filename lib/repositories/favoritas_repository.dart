import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/moeda.dart';
import 'moeda_repository.dart';

class FavoritasRepository extends ChangeNotifier {
  List<Moeda> _lista = [];
  /*
  late FirebaseFirestore db;
  late AuthService auth;

  FavoritasRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readFavoritas();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readFavoritas() async {
    if (auth.usuario != null && _lista.isEmpty) {
      final snapshot =
          await db.collection('usuarios/${auth.usuario!.uid}/favoritas').get();

      snapshot.docs.forEach((doc) {
        Moeda moeda = MoedaRepository.tabela
            .firstWhere((moeda) => moeda.sigla == doc.get('sigla'));
        _lista.add(moeda);
        notifyListeners();
      });
    }
  }*/

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  saveAll(List<Moeda> moedas) {
    moedas.forEach((moeda) async {
      if (!lista.contains(moeda)) _lista.add(moeda);
    });
    notifyListeners();
  }

  remove(Moeda moeda) async {
    _lista.remove(moeda);
    notifyListeners();
  }
}
