import 'package:flutter/material.dart';
import 'package:formulario/client.dart';
import 'package:formulario/form.dart';
import 'package:formulario/listScreen.dart';


void main() {
  runApp(BancoApp());
}

class BancoApp extends StatefulWidget {
  @override
  _BancoAppState createState() => _BancoAppState();
}

class _BancoAppState extends State<BancoApp> {
  List<Cliente> clientes = [];

  void adicionarCliente(Cliente cliente) {
    setState(() {
      clientes.add(cliente);
    });
  }

  void removerCliente(Cliente cliente) {
    setState(() {
      clientes.remove(cliente);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(adicionarCliente: adicionarCliente, clientes: clientes, removerCliente: removerCliente),
        '/formulario': (context) => FormularioClientePage(onSubmit: adicionarCliente),
        '/lista': (context) => ListaClientesPage(clientes: clientes, onDelete: removerCliente),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final Function(Cliente) adicionarCliente;
  final List<Cliente> clientes;
  final Function(Cliente) removerCliente;

  HomePage({required this.adicionarCliente, required this.clientes, required this.removerCliente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicação Bancária"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formulario');
              },
              child: Text("Adicionar Cliente"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lista');
              },
              child: Text("Ver Lista de Clientes"),
            ),
          ],
        ),
      ),
    );
  }
}
