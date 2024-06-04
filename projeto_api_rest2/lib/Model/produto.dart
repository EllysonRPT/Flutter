class Produtos {
  final String id;
  final String nome;
  final double preco;
  final String codigo;

  Produtos(
      {required this.id,
      required this.nome,
      required this.preco,
      required this.codigo});
      
        Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'codigo': codigo,
    'preco': preco
  };
  //fromJson
  factory Produtos.fromJson(Map<String, dynamic> json) => Produtos(
    id: (json['id']).toString(),
    nome: json['nome'],
    codigo: json['codigo'],
    preco: json['preco'] is double ? json['preco'] : double.parse(json['preco'].toString())
  );

}
