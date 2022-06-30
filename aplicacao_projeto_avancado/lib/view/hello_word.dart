import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  String? nome;

  dialog(String mensagem, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(mensagem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Form(
        child: Column(
          children: [
            TextField(
              onChanged: (value) => nome = value,
              decoration: InputDecoration(
                  label: Text('Nome'), hintText: 'Insira o nome'),
            ),
            ElevatedButton(
              child: Text('OK'),
              onPressed: () => dialog('Hello World $nome', context),
            ),
          ],
        ),
      ),
    );
  }
}
