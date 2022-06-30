import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  var primeirovotao = ElevatedButton(
    child: Text('Primeiro Botao'),
    onPressed: () {
      print('Primeiro botão');
    },
  );

  Widget criarBotao(String rotulo, VoidCallback? acao) {
    return ElevatedButton(child: Text(rotulo), onPressed: acao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          criarBotao(
              'Contador', () => Navigator.pushNamed(context, '/contador')),
          criarBotao(
              'Hello World', () => Navigator.pushNamed(context, '/helloWorld')),
          criarBotao('Calcular Idade', () => print('Terceiro Botão')),
          criarBotao('Calculadora',
              () => Navigator.pushNamed(context, '/calculadora')),
        ],
      )),
    );
  }
}
