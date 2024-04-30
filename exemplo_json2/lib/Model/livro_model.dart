class Livro {
  final String titulo;
  final String autor;
  final String sinopse;
  final String categoria;
  final int ISBN;
 
  Livro({required this.titulo, required this.autor, required this.sinopse, required this.categoria, required this.ISBN});

  //metodo

Map<String,dynamic> toJson(){
  return {
    'titulo': titulo,
    'autor': autor,
   'sinopse': sinopse,
    'categoria': categoria,
    'ISBN': ISBN,
  };
}
factory Livro.fromJson(Map<String,dynamic>json){
  return Livro(
    titulo: json['titulo'],
    autor: json['autor'],
    sinopse: json['sinopse'],
    categoria: json['categoria'],
    ISBN: json['ISBN'],
  );
}
}
