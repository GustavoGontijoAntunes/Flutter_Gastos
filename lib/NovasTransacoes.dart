import 'package:flutter/material.dart';

class NovasTransacoes extends StatelessWidget {
  final descritivoController = TextEditingController();
  final gastoController = TextEditingController();
  final Function addTxt;

  NovasTransacoes(this.addTxt);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: descritivoController,
              decoration: InputDecoration(
                labelText: "Descrição",
              ),
            ),
            TextField(
              controller: gastoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço",
              ),
              onSubmitted: (_) => {
                addTxt(descritivoController.text, double.parse(gastoController.text)),
              },
            ),
            ElevatedButton(
              onPressed: () {
                addTxt(descritivoController.text, double.parse(gastoController.text));
              },
              child: Text(
                "Incluir",
              ),
            ),
          ],
        ),
      ),
    );
  }
}