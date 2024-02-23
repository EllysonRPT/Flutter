class Tarefas {
  String descricao;
  bool concluida;
  DateTime dataHora;
  //construtor
  Tarefas(this.descricao, this.concluida): dataHora = DateTime.now();
}
