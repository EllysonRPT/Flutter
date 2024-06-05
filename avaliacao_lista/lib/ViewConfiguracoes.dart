import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:avaliacao_lista/ViewLogin.dart'; // Importe a tela de login

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
  late ScaffoldMessengerState _scaffoldMessengerState;
  TextEditingController _tarefaController = TextEditingController();

  // Lista de tarefas
  List<Map<String, Object>> _tarefas = [];
  bool _mostrarConcluidas = false;

  _ConfiguracoesPageState({required this.email});

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scaffoldMessengerState = ScaffoldMessenger.of(context);
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      // Carregar as tarefas salvas
      _tarefas = (_prefs.getStringList('${email}tarefas') ?? []).map((task) {
        return {'descricao': task, 'concluida': false};
      }).toList();
    });
  }

  Future<void> _salvarTarefas() async {
    await _prefs.setStringList('${email}tarefas',
        _tarefas.map((task) => task['descricao'] as String).toList());
  }

  void _adicionarTarefa(String tarefa) {
    setState(() {
      _tarefas.add({'descricao': tarefa, 'concluida': false});
      _tarefaController.clear(); // Limpa o campo de texto
      _salvarTarefas();
    });

    // Exibir feedback ao usuário
    _scaffoldMessengerState.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(child: Text('Tarefa adicionada: $tarefa')),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _scaffoldMessengerState.hideCurrentSnackBar();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _removerTarefa(int index) {
    setState(() {
      final tarefaRemovida = _tarefas.removeAt(index);
      _salvarTarefas();

      // Exibir feedback ao usuário
      _scaffoldMessengerState.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Expanded(child: Text('Tarefa removida: ${tarefaRemovida['descricao']}')),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _scaffoldMessengerState.hideCurrentSnackBar();
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
    });
  }

  void _editarTarefa(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String novaTarefa = _tarefas[index]['descricao'] as String;
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
                  _tarefas[index]['descricao'] = novaTarefa;
                  _salvarTarefas();
                });
                // Fechar o diálogo
                Navigator.of(context).pop();
                // Exibir feedback ao usuário
                _scaffoldMessengerState.showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Expanded(child: Text('Tarefa editada com sucesso.')),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            _scaffoldMessengerState.hideCurrentSnackBar();
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

  void _concluirTarefa(int index) {
    setState(() {
      _tarefas[index]['concluida'] = !(_tarefas[index]['concluida'] as bool);
      _salvarTarefas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tarefasFiltradas = _mostrarConcluidas
        ? _tarefas.where((tarefa) => tarefa['concluida'] as bool).toList()
        : _tarefas;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: [
          IconButton(
            icon: Icon(_mostrarConcluidas ? Icons.check_box : Icons.check_box_outline_blank),
            onPressed: () {
              setState(() {
                _mostrarConcluidas = !_mostrarConcluidas;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Navegar de volta para a tela de login
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tarefasFiltradas.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(tarefasFiltradas[index]['descricao'] as String),
                  value: tarefasFiltradas[index]['concluida'] as bool,
                  onChanged: (value) {
                    _concluirTarefa(index);
                  },
                  secondary: Row(
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
                      _scaffoldMessengerState.showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Expanded(child: Text('Por favor, insira uma tarefa.')),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  _scaffoldMessengerState.hideCurrentSnackBar();
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
}
