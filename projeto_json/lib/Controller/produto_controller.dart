import 'dart:convert';
import 'dart:io';

import '../Model/produto_model.dart';

class ProdutoController {
  //atributos
  List<Produto> _produtos = [];

  List<Produto> get produtos {
    return _produtos;
  }

  //save produtos no json
  Future<void> salvar_json() async {
    final file = File('produtos.json');
    final jsonList = produtos.map((produto) => produto.toJson()).toList();
    await file.writeAsString(json.encode(jsonList));
  }

  //carrega
  Future<void> carregar_json() async {
    try {
      final file = File('produtos.json');
      final jsonList = json.decode(await file.readAsString());
      _produtos = jsonList.map((json) => Produto.fromJson(json)).toList();
    } catch (e) {
      _produtos = [];
    }
  }
}
