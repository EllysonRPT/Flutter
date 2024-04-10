class ContatoModel {
  //atributos
  int senha;
  String nome;
  String email;
  String telefone;
  String endereco;
  //construtor
  ContatoModel({
    required this.senha,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
  });
  //mapeamento 
    Map<String, dynamic> toMap() {
    return {
      'senha': senha,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
    };
  }
    factory ContatoModel.fromMap(Map<String, dynamic> map) {
    return ContatoModel(
      senha: map['senha'],
      nome: map['nome'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
    );
  }
}
