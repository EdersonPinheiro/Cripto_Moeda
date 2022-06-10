import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'configs/app_settings.dart';
import 'crypto.dart';
import 'pages/home_page.dart';
import 'repositories/conta_repository.dart';
import 'repositories/favoritas_repository.dart';

void main() async {
  ;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContaRepository()),
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(
          create: (context) => FavoritasRepository(),
        ),
      ],
      child: Crypto(),
    ),
  );
}
