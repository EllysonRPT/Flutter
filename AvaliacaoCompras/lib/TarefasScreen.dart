import 'package:app_todo/TarefasController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TarefasScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Novo Produto',
                suffixIcon: IconButton(
                  onPressed: () {
                    DateTime now = DateTime.now();
                    String descricaoTarefa =
                        '${_controller.text} - ${DateFormat('dd/MM/yyyy HH:mm').format(now)}';
                    Provider.of<TarefasController>(context, listen: false)
                        .adicionarTarefa(_controller.text);
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<TarefasController>(
              builder: (context, model, child) {
                model.tarefas.sort((a, b) => a.descricao.compareTo(b.descricao));
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${model.tarefas[index].descricao} - ${DateFormat('dd/MM/yyyy HH:mm').format(model.tarefas[index].dataHora)}'),
                      trailing: Checkbox(
                        value: model.tarefas[index].concluida,
                        onChanged: (value) {
                          model.marcarComoConcluida(index, value);
                        },
                      ),
                      onLongPress: () {
                        _exibirDialogoExclusao(context, model, index);
                      },
                      // Adicionando o gesto de toque para edição da tarefa
                      onTap: () {
                        _editarTarefa(context, model, index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _exibirDialogoExclusao(
      BuildContext context, TarefasController model, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Excluir Tarefa"),
          content: Text("Você deseja excluir esta tarefa?"),
          actions: <Widget>[
            TextButton(
              child: Text("Não"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Sim"),
              onPressed: () {
                model.excluirTarefas(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Método para editar a tarefa
  void _editarTarefa(BuildContext context, TarefasController model, int index) {
    TextEditingController _editarController =
        TextEditingController(text: model.tarefas[index].descricao);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Editar Tarefa"),
          content: TextField(
            controller: _editarController,
            decoration: InputDecoration(labelText: 'Descrição'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Salvar"),
              onPressed: () {
                // Atualizar a descrição da tarefa apenas quando o botão "Salvar" for pressionado
                model.atualizarTarefa(index, _editarController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
