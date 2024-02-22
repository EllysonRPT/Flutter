import 'package:app_todolist/TarefasModel.dart';
import 'package:flutter/material.dart';

class TareasController extends ChangeNotifier {
  List<Tarefas> _tarefas = [];
  List<Tarefas> get tarefas => _tarefas;

  //metodo para adiconar  uma nova tarefa
  void adicionaeTarefa(String descricao) {
    _tarefas.add(Tarefas(descricao, false));
    notifyListeners();
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
    }
  }
  void 
}
