import 'package:flutter/material.dart';
import 'package:gastos/NovasTransacoes.dart';
import 'package:gastos/Transacao.dart';
import 'package:gastos/TransacoesWidget.dart';
import 'package:intl/intl.dart';

class TransacoesUsuario extends StatefulWidget {

  @override
  _TransacoesUsuarioState createState() => _TransacoesUsuarioState();
}

class _TransacoesUsuarioState extends State<TransacoesUsuario> {
  final List<Transacao> transacoes = [
    Transacao(id: "A1", title: "Café", amount: 2.00, date: DateTime.now()),
    Transacao(id: "A2", title: "Pão de Queijo", amount: 3.00, date: DateTime.now())
  ];

  void _addNewTransaction(String txtDescritivo, double valor){
    final novoGasto = Transacao(
      id: DateTime.now().toString(),
      title: txtDescritivo,
      amount: valor,
      date: DateTime.now(),
    );

    setState((){
      transacoes.add(novoGasto);
    });
  }

  void _deleteTransaction(String id){
    setState((){
      transacoes.removeWhere((txt) => txt.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NovasTransacoes(_addNewTransaction),
        TransacoesWidget(transacoes, _deleteTransaction),
      ],
    );
  }
}
