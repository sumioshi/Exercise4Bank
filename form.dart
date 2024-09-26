import 'package:flutter/material.dart';
import 'client.dart';

class FormularioClientePage extends StatefulWidget {
  final Function(Cliente) onSubmit;

  FormularioClientePage({required this.onSubmit});

  @override
  _FormularioClientePageState createState() => _FormularioClientePageState();
}

class _FormularioClientePageState extends State<FormularioClientePage> {
  final _nomeController = TextEditingController();
  final _saldoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Cliente")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Cliente'),
            ),
            TextField(
              controller: _saldoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Saldo Inicial'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final nome = _nomeController.text;
                final saldo = double.tryParse(_saldoController.text) ?? 0.0;

                if (nome.isNotEmpty && saldo > 0) {
                  final novoCliente = Cliente(nome: nome, saldo: saldo);
                  widget.onSubmit(novoCliente);
                  Navigator.pop(context);
                }
              },
              child: Text("Adicionar Cliente"),
            )
          ],
        ),
      ),
    );
  }
}
