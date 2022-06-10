import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class Crypto extends StatelessWidget {
  const Crypto({Key? key}) : super(key: key);

  static const MaterialColor kToDark = const MaterialColor(
    0xff4ea393,
    //0xff57b5a3, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff4ea393), //10%
      100: const Color(0xff469182), //20%
      200: const Color(0xff3d7f72), //30%
      300: const Color(0xff346d62), //40%
      400: const Color(0xff2c5b52), //50%
      500: const Color(0xff234841), //60%
      600: const Color(0xff1a3631), //70%
      700: const Color(0xff112421), //80%
      800: const Color(0xff091210), //90%
      900: const Color(0xff000000), //100%
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cripto Moedas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: kToDark),
      home: HomePage(),
    );
  }
}
