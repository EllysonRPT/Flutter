import 'package:app_todo/TarefasController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TarefasScreen extends StatelessWidget {
  // Controlador para o campo de texto de nova tarefa
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Novo Produto',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Obtendo a data e hora atuais
                    DateTime now = DateTime.now();
                    String descricaoTarefa =
                        '${_controller.text} - ${DateFormat('dd/MM/yyyy HH:mm').format(now)}';
                    // Chamando o método adicionarTarefa do Provider para atualizar o estado
                    Provider.of<TarefasController>(context, listen: false)
                        .adicionarTarefa(_controller.text);
                    // Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<TarefasController>(
              builder: (context, model, child) {
                // Ordenar as tarefas em ordem alfabética
                model.tarefas.sort((a, b) => a.descricao.compareTo(b.descricao));
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(
                          '${model.tarefas[index].descricao} - ${DateFormat('dd/MM/yyyy HH:mm').format(model.tarefas[index].dataHora)}'),

                      // Checkbox para marcar a tarefa como concluída
                      trailing: Checkbox(
                        value: model.tarefas[index].concluida,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoConcluida(index, value);
                        },
                      ),
                      // Exclui a tarefa ao manter pressionado
                      onLongPress: () {
                        _exibirDialogoExclusao(context, model, index);
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

  // Método para exibir o diálogo de confirmação de exclusão
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
                // Chamando o método excluirTarefa do Provider para atualizar o estado
                model.excluirTarefas(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
