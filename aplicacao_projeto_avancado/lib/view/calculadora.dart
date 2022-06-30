import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String? valor;

  String? calcularValor(String numeroDigitado) {
    setState(() {
      if (valor == null) {
        valor = numeroDigitado;
      } else {
        valor = valor! + numeroDigitado;
      }
    });
  }

  Widget botaoCalculadora(String rotulo, Color color, VoidCallback? acao) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), primary: color),
        child: Container(
          width: 20,
          height: 50,
          alignment: Alignment.center,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Text(
            rotulo,
            style: TextStyle(fontSize: 15),
          ),
        ),
        onPressed: acao,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            children: [
              Row(children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: Text(valor.toString()),
                )
              ]),
              Row(
                children: [
                  botaoCalculadora('AC', Colors.grey, () => print('AC')),
                  botaoCalculadora('+/-', Colors.grey, () => print('+/-')),
                  botaoCalculadora('%', Colors.grey, () => print('%')),
                  botaoCalculadora(':', Colors.orange, () => print(':')),
                ],
              ),
              Row(
                children: [
                  botaoCalculadora('7', Colors.grey, () => calcularValor('7')),
                  botaoCalculadora('8', Colors.grey, () => print('8')),
                  botaoCalculadora('9', Colors.grey, () => print('9')),
                  botaoCalculadora('x', Colors.orange, () => print('X')),
                ],
              ),
              Row(
                children: [
                  botaoCalculadora('4', Colors.grey, () => print('7')),
                  botaoCalculadora('5', Colors.grey, () => print('8')),
                  botaoCalculadora('6', Colors.grey, () => print('9')),
                  botaoCalculadora('-', Colors.orange, () => print('X')),
                ],
              ),
              Row(
                children: [
                  botaoCalculadora('1', Colors.grey, () => print('7')),
                  botaoCalculadora('2', Colors.grey, () => print('8')),
                  botaoCalculadora('3', Colors.grey, () => print('9')),
                  botaoCalculadora('+', Colors.orange, () => print('X')),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      botaoCalculadora('0', Colors.grey, () => print('7')),
                      botaoCalculadora(',', Colors.grey, () => print('8')),
                      botaoCalculadora('=', Colors.orange, () => print('9')),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
