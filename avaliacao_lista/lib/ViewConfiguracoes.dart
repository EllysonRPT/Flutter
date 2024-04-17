import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ViewLogin.dart'; // Importe sua tela de login

class ConfiguracoesPage extends StatefulWidget {
  final String email;

  ConfiguracoesPage({required this.email});

  @override
  _ConfiguracoesPageState createState() =>
      _ConfiguracoesPageState(email: email);
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences _prefs;
  final String email;
  TextEditingController _tarefaController = TextEditingController();

  // Lista de tarefas
  List<String> _tarefas = [];

  _ConfiguracoesPageState({required this.email});

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      // Carregar as tarefas salvas
      _tarefas = _prefs.getStringList('${email}tarefas') ?? [];
    });
  }

  Future<void> _salvarTarefas() async {
    await _prefs.setStringList('${email}tarefas', _tarefas);
  }

  void _adicionarTarefa(String tarefa) {
    setState(() {
      _tarefas.add(tarefa);
      _tarefaController.clear(); // Limpa o campo de texto
      _salvarTarefas();
    });

    // Exibir feedback ao usuário
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(child: Text('Tarefa adicionada: $tarefa')),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _removerTarefa(int index) {
    final tarefaRemovida = _tarefas.removeAt(index);
    _salvarTarefas();

    // Exibir feedback ao usuário
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(child: Text('Tarefa removida: $tarefaRemovida')),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              _tarefas.insert(index, tarefaRemovida);
              _salvarTarefas();
            });
          },
        ),
      ),
    );
  }

  void _editarTarefa(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String novaTarefa = _tarefas[index];
        return AlertDialog(
          title: Text('Editar Tarefa'),
          content: TextFormField(
            controller: TextEditingController(text: novaTarefa),
            onChanged: (value) {
              novaTarefa = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _tarefas[index] = novaTarefa;
                  _salvarTarefas();
                  Navigator.of(context).pop();
                });

                // Exibir feedback ao usuário
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Expanded(child: Text('Tarefa editada com sucesso.')),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tarefas[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _editarTarefa(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _removerTarefa(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _tarefaController,
                    decoration: InputDecoration(
                      labelText: 'Nova Tarefa',
                    ),
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _adicionarTarefa(value);
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    final novaTarefa = _tarefaController.text.trim();
                    if (novaTarefa.isNotEmpty) {
                      _adicionarTarefa(novaTarefa);
                    } else {
                      // Exibir feedback ao usuário se o campo estiver vazio
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Expanded(child: Text('Por favor, insira uma tarefa.')),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    // Limpar as preferências
    await _prefs.remove('${email}darkMode');
    await _prefs.remove('${email}idioma');

    // Redirecionar para a tela anterior
    Navigator.pop(context);

    // Exibir feedback ao usuário
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(child: Text('Você saiu da conta.')),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ],
        ),
      ),
    );
  }
}
