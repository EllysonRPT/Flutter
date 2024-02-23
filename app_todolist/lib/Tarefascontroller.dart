import 'package:app_todo/TarefasModel.dart';
import 'package:flutter/material.dart';

class TarefasController extends ChangeNotifier {
  List<Tarefas> _tarefas = [];
  List<Tarefas> get tarefas => _tarefas;

  //metodo para adiconar  uma nova tarefa
  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty) {
       _tarefas.add(Tarefas(descricao, false));
    notifyListeners();
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
  //  String getDataHoraUltimaTarefaAdicionada() {
  //   if (_tarefas.isNotEmpty) {
  //     return DateFormat('dd/MM/yyyy HH:mm').format(_tarefas.last.dataHora);
  //   } else {
  //     return '';
  //   }
  // }
}

