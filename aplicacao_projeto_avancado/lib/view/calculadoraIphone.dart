import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculadoraIphone extends StatefulWidget {
  const CalculadoraIphone({Key? key}) : super(key: key);

  @override
  State<CalculadoraIphone> createState() => _CalculadoraIphoneState();
}

class _CalculadoraIphoneState extends State<CalculadoraIphone> {

  Widget botaoCalculadora(String btnTxt, Color btbCor, Color TextClr){
    return Container(
      child: RaisedButton(
        onPressed: (){
          calcular(btnTxt);
        },
        child: Text(btnTxt,
          style: TextStyle(
            fontSize: 35,
            color: TextClr),
        ),
        shape: CircleBorder(),
        color: btbCor,
        padding: EdgeInsets.all(20),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Calculadora'),backgroundColor: Colors.black,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Display da calculadora
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(10.0),
                child: Text(valor,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white,
                fontSize: 100),
                ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botaoCalculadora('AC',Colors.grey, Colors.black),
                botaoCalculadora('+/-',Colors.grey, Colors.black),
                botaoCalculadora('%',Colors.grey, Colors.black),
                botaoCalculadora('/',Colors.amber, Colors.black),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botaoCalculadora('7',Colors.black12, Colors.white),
                botaoCalculadora('8',Colors.black12, Colors.white),
                botaoCalculadora('9',Colors.black12, Colors.white),
                botaoCalculadora('x',Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botaoCalculadora('4',Colors.black12, Colors.white),
                botaoCalculadora('5',Colors.black12, Colors.white),
                botaoCalculadora('6',Colors.black12, Colors.white),
                botaoCalculadora('-',Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botaoCalculadora('1',Colors.black12, Colors.white),
                botaoCalculadora('2',Colors.black12, Colors.white),
                botaoCalculadora('3',Colors.black12, Colors.white),
                botaoCalculadora('+',Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: (){
                    calcular('0');
                  },
                  shape: StadiumBorder(),
                  child: Text('0',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white),
                  ),
                  color: Colors.grey[850],
                ),
                botaoCalculadora('.',Colors.black12,Colors.white),
                botaoCalculadora('=',Colors.amber,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  //Logica Calculadora
  dynamic valor ='0';
  double primeiroNumero = 0;
  double segundoNumero = 0;

  dynamic resultado = '';
  dynamic resultadoFinal = '';
  dynamic operador = '';
  dynamic preOperador = '';
  void calcular(btnText) {


    if(btnText  == 'AC') {
      valor ='0';
      primeiroNumero = 0;
      segundoNumero = 0;
      resultado = '';
      resultadoFinal = '0';
      operador = '';
      preOperador = '';

    } else if( operador == '=' && btnText == '=') {

      if(preOperador == '+') {
        resultadoFinal = add();
      } else if( preOperador == '-') {
        resultadoFinal = sub();
      } else if( preOperador == 'x') {
        resultadoFinal = mul();
      } else if( preOperador == '/') {
        resultadoFinal = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(primeiroNumero == 0) {
        primeiroNumero = double.parse(resultado);
      } else {
        segundoNumero = double.parse(resultado);
      }

      if(operador == '+') {
        resultadoFinal = add();
      } else if( operador == '-') {
        resultadoFinal = sub();
      } else if( operador == 'x') {
        resultadoFinal = mul();
      } else if( operador == '/') {
        resultadoFinal = div();
      }
      preOperador = operador;
      operador = btnText;
      resultado = '';
    }
    else if(btnText == '%') {
      resultado = primeiroNumero / 100;
      resultadoFinal = contemDecimal(resultado);
    } else if(btnText == '.') {
      if(!resultado.toString().contains('.')) {
        resultado = resultado.toString()+'.';
      }
      resultadoFinal = resultado;
    }

    else if(btnText == '+/-') {
      resultado.toString().startsWith('-') ? resultado = resultado.toString().substring(1): resultado = '-'+resultado.toString();
      resultadoFinal = resultado;

    }

    else {
      resultado = resultado + btnText;
      resultadoFinal = resultado;
    }


    setState(() {
      valor = resultadoFinal;
    });

  }


  String add() {
    resultado = (primeiroNumero + segundoNumero).toString();
    primeiroNumero = double.parse(resultado);
    return contemDecimal(resultado);
  }

  String sub() {
    resultado = (primeiroNumero - segundoNumero).toString();
    primeiroNumero = double.parse(resultado);
    return contemDecimal(resultado);
  }
  String mul() {
    resultado = (primeiroNumero * segundoNumero).toString();
    primeiroNumero = double.parse(resultado);
    return contemDecimal(resultado);
  }
  String div() {
    resultado = (primeiroNumero / segundoNumero).toString();
    primeiroNumero = double.parse(resultado);
    return contemDecimal(resultado);
  }


  String contemDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

}
