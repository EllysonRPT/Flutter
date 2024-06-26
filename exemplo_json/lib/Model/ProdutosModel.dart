import 'dart:convert';

class Produto {
  //atributo
  final nome;
  final double preco;
  final String categoria;
  //construtor
  Produto({required this.nome, required this.preco, required this.categoria});
//
  Map<String, dynamic> toJson() {
    return {'nome': nome, 'preco': preco, 'categoria': categoria};
  }

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
    );
  }
}
