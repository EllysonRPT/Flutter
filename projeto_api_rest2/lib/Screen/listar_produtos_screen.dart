import 'package:flutter/material.dart';

import '../Controllers/produtosController.dart';
import '../Model/produto.dart';

class ListarProdutosScreen extends StatefulWidget {
  const ListarProdutosScreen({super.key});

  @override
  State<ListarProdutosScreen> createState() => _ListarProdutosScreenState();
}

class _ListarProdutosScreenState extends State<ListarProdutosScreen> {
  final ProdutosController _controller = ProdutosController();

  Future<void> _getProdutos() async {
    try {
      await _controller.getProdutos();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Produtos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _getProdutos(),
              builder: (context, snapshot) {
                if (_controller.listProdutos.isNotEmpty) {
                  return ListView.builder(
                    itemCount: _controller.listProdutos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_controller.listProdutos[index].nome),
                        subtitle: Text(_controller.listProdutos[index].codigo),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/cadastrar');
          //   },
          //   child: const Text('cadastrar'),
          // ),
        ],
      ),
    );
  }
}
