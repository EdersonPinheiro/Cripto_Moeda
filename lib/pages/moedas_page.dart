import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../configs/app_settings.dart';
import '../models/moeda.dart';
import '../palet_colors.dart';
import '../repositories/favoritas_repository.dart';
import '../repositories/moeda_repository.dart';
import 'moedas_detalhes_page.dart';

class MoedasPage extends StatefulWidget {
  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  late NumberFormat real;
  late Map<String, String> loc;
  List<Moeda> selecionadas = [];
  late FavoritasRepository favoritas;

  readNumberFormat() {
    loc = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: Center(
            child: Text(
          'Cripto Moedas',
          style: TextStyle(color: Colors.white),
        )),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
        ),
        title: Text('${selecionadas.length} selecionadas',
            style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
      );
    }
  }

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: moeda),
      ),
    );
  }

  limparSelecionadas() {
    setState(() {
      selecionadas = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    //favoritas = Provider.of<FavoritasRepository>(context);
    favoritas = context.watch<
        FavoritasRepository>(); // importação para recuperar os dados - instancia do provider
    readNumberFormat();
    final tabela = MoedaRepository.tabela;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBarDinamica(),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              leading: (selecionadas.contains(tabela[moeda]))
                  ? CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : SizedBox(
                      width: 40, child: Image.asset(tabela[moeda].icone)),
              title: Row(children: [
                Text(
                  tabela[moeda].nome,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
                if (favoritas.lista.contains(tabela[moeda]))
                  Icon(Icons.star, color: Colors.amber, size: 8)
              ]),
              trailing: Text(real.format(
                tabela[moeda].preco,
              )),
              selected: selecionadas.contains(tabela[moeda]),
              selectedTileColor: Colors.indigo[50],
              onLongPress: () {
                setState(() {
                  (selecionadas).contains(tabela[moeda])
                      ? selecionadas.remove(tabela[moeda])
                      : selecionadas.add(tabela[moeda]);
                });
              },
              onTap: () => mostrarDetalhes(tabela[moeda]),
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, __) => Divider(),
          itemCount: tabela.length),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                favoritas.saveAll(selecionadas);
                limparSelecionadas();
              },
              icon: Icon(Icons.star),
              label: Text(
                'Favoritar ',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
