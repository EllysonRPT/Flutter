import 'package:app_todo/TarefasModel.dart';
import 'package:flutter/material.dart';

class TarefasController extends ChangeNotifier {
  List<Tarefas> _tarefas = [];
  List<Tarefas> get tarefas => _tarefas;

  //metodo para adiconar  uma nova tarefa
  void adicionarTarefa(String descricao) {
  // Verifica se a descrição não está vazia ou composta apenas de espaços em branco
  if (descricao.trim().isNotEmpty) {
    // Verifica se não existe uma tarefa com a mesma descrição
    if (!_tarefas.any((tarefa) => tarefa.descricao == descricao)) {
      _tarefas.add(Tarefas(descricao, false));
      notifyListeners();
    } else {
      print('Uma tarefa com a mesma descrição já existe.');
    }
  }
}


  void marcarComoConcluida(int indice,value) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = value;
      notifyListeners();
    }
  }
  

  void excluirTarefas(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }
 
}

