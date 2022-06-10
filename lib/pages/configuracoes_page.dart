import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../palet_colors.dart';
import '../repositories/conta_repository.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    final conta = context.watch<ContaRepository>();
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(
            child: Text(
          'Configurações',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Saldo',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                real.format(conta.saldo),
                style: TextStyle(
                  fontSize: 25,
                  color: primaryColor,
                ),
              ),
              trailing: IconButton(
                onPressed: updateSaldo,
                icon: Icon(Icons.edit),
              ),
            ),
            Divider(),
            /*Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: OutlinedButton(
                  onPressed: () => context.read<AuthService>().logout(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Sair do app',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ),
                    ],
                  )),
            ),*/
          ],
        ),
      ),
    );
  }

  updateSaldo() async {
    final form = GlobalKey<FormState>();
    final valor = TextEditingController();
    final conta = context.read<ContaRepository>();

    valor.text = conta.saldo.toString();

    AlertDialog dialog = AlertDialog(
      title: Text('Atualizar o saldo'),
      content: Form(
          key: form,
          child: TextFormField(
            controller: valor,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d\.?\d*')),
            ],
            validator: (value) {
              if (value!.isEmpty) return 'Informe o valor do saldo';
              return null;
            },
          )),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('CANCELAR')),
        TextButton(
            onPressed: () {
              if (form.currentState!.validate()) {
                conta.setSaldo(double.parse(valor.text));
                Navigator.pop(context);
              }
            },
            child: Text('SALVAR'))
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }
}
