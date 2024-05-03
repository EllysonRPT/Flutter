import '../Model/carros_model.dart';

class ProdutoController {
  final List<Carro> _carros = [];

  // void adicionarCarro(Carro carro) {
  //   _carros.add(carro);
  // }
}






// import 'dart:convert';
// import 'dart:io';

// import '../Model/carros_model.dart';

// class ProdutoController {
//   //atributos
//   List<Produto> _produtos = [];

//   List<Produto> get produtos {
//     return _produtos;
//   }

//   //set
//   set produtos(List<Produto> produtos) {
//     _produtos = produtos;
//   }

//   //save produtos no json
//   Future<void> salvar_json() async {
//     final file = File('produtos.json');
//     final jsonList = produtos.map((produto) => produto.toJson()).toList();
//     await file.writeAsString(json.encode(jsonList));
//   }

//   //carrega
//   Future<List<Produto>> carregar_json() async {
//     try {
//       final file = File('produtos.json');
//       final jsonList = json.decode(await file.readAsString());
//       produtos = jsonList.map((json) => Produto.fromJson(json)).toList();
//     } catch (e) {
//       produtos = [];
//     }
//     return produtos;
//   }
// }
