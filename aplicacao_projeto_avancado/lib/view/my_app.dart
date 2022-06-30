import 'package:aplicacao_projeto_avancado/view/hello_word.dart';
import 'package:aplicacao_projeto_avancado/view/menu.dart';
import 'package:flutter/material.dart';

import 'calculadora.dart';
import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        '/': (context) => Menu(),
        '/contador': (context) => MyHomePage(),
        '/helloWorld': (context) => HelloWorld(),
        '/calculadora': (context) => Calculadora(),
      },
    );
  }
}
