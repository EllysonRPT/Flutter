class Todolist {
  //atributos
  final String id;
  final String titulo;
  final String userId;
  final DateTime timeStamp;

  Todolist({required this.id, required this.titulo, required this.userId, required this.timeStamp});

//tomap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'userId': userId,
      'timeStamp': timeStamp.toString(),
    };
  }

  //from map
  factory Todolist.fromMap(Map<String, dynamic> map) {
    return Todolist(
      id: map['id'],
      titulo: map['titulo'],
      userId: map['userId'],
      timeStamp: map['timeStamp'],
    );
  }
  
}
