import 'package:flutter/material.dart';
import 'client.dart';


class ListaClientesPage extends StatelessWidget {
  final List<Cliente> clientes;
  final Function(Cliente) onDelete;

  ListaClientesPage({required this.clientes, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Clientes")),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(clientes[index].nome),
            subtitle: Text('Saldo: \$${clientes[index].saldo.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                onDelete(clientes[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
