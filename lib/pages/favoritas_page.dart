import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../palet_colors.dart';
import '../repositories/favoritas_repository.dart';
import '../widgets/moeda_card.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({Key? key}) : super(key: key);

  @override
  State<FavoritasPage> createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Moedas Favoritas"))),
      backgroundColor: backgroundColor,
      body: Container(
        //color: Colors.indigo.withOpacity(0.05),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12),
        child: Consumer<FavoritasRepository>(
          //Consumir provider
          builder: (context, favoritas, child) {
            return favoritas.lista.isEmpty
                ? ListTile(
                    leading: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    title: Text(
                      'Ainda não há moedas favoritas',
                      style: TextStyle(color: Colors.black87),
                    ))
                : ListView.builder(
                    itemCount: favoritas.lista.length,
                    itemBuilder: (_, index) {
                      return MoedaCard(moeda: favoritas.lista[index]);
                    },
                  );
          },
        ),
      ),
    );
  }
}
