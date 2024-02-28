import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:app_todo/TarefasController.dart';

class TarefasScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  void _exibirFeedback(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  void _excluirTodasTarefas(BuildContext context) {
    Provider.of<TarefasController>(context, listen: false).excluirTodasTarefas();
    _exibirFeedback(context, 'Todas as tarefas foram removidas');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Compras',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue, // Altera a cor do AppBar
        elevation: 0, // Remove a sombra do AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _excluirTodasTarefas(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 171, 210, 243), Color.fromRGBO(179, 184, 178, 0.694)], // Define um gradiente de cores para o fundo
          ),
        ),
        child: Column(
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
                      _exibirFeedback(context, 'Tarefa adicionada com sucesso');
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
                      return Dismissible(
                        key: Key(model.tarefas[index].descricao), // Adicionando uma chave única
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          String mensagem = 'Tarefa removida: ${model.tarefas[index].descricao}';
                          model.excluirTarefas(index);
                          _exibirFeedback(context, mensagem);
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20.0),
                          color: Colors.red,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: Card(
                          color: Color.fromARGB(179, 199, 255, 157), // Cor de fundo do Card
                          elevation: 3, // Elevação do Card
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: ListTile(
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
                            onTap: () {
                              _editarTarefa(context, model, index);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
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
                String mensagem = 'Tarefa removida: ${model.tarefas[index].descricao}';
                model.excluirTarefas(index);
                Navigator.of(context).pop();
                _exibirFeedback(context, mensagem);
              },
            ),
          ],
        );
      },
    );
  }

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
                model.atualizarTarefa(index, _editarController.text);
                Navigator.of(context).pop();
                _exibirFeedback(context, 'Tarefa editada com sucesso');
              },
            ),
          ],
        );
      },
    );
  }
}
