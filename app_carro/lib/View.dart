import 'package:flutter/material.dart';
import 'package:app_carro/Controller.dart';
import 'package:app_carro/Model.dart';
import 'package:provider/provider.dart';

class TelaListaCarros extends StatelessWidget {
  final CarroController controllerCarros;
  TelaListaCarros(this.controllerCarros);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Carros'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Lista de carros usando um Consumer do Provider para atualização automática
          Expanded(
            child: ListView.builder(
              itemCount: controllerCarros.listarCarros.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // Exibição do modelo do carro
                  title: Text(controllerCarros.listarCarros[index].modelo),
                  // Navegação para os detalhes do carro ao ser clicado
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaDetalheCarro(
                          controllerCarros.listarCarros[index],
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
      // Botão flutuante para adicionar um novo carro
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogAdicionarCarro(context);
        },
        
      ),
    );
  }

  // Método para exibir um diálogo para adicionar um novo carro
  void _mostrarDialogAdicionarCarro(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String modelo = '';
        int ano = 0;
        String imagemUrl = '';

        return AlertDialog(
          title: Text("Adicionar Novo Carro"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Campo de texto para o modelo do carro
              TextField(
                onChanged: (value) {
                  modelo = value;
                },
                decoration: InputDecoration(labelText: 'Modelo'),
              ),
              // Campo de texto para o ano do carro
              TextField(
                onChanged: (value) {
                  ano = int.tryParse(value) ?? 0;
                },
                decoration: InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
              ),
              // Campo de texto para a URL da imagem do carro
              TextField(
                onChanged: (value) {
                  imagemUrl = value;
                },
                decoration: InputDecoration(labelText: 'URL da Imagem'),
              ),
            ],
          ),
          actions: <Widget>[
            // Botão para cancelar a adição do carro
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // Botão para confirmar a adição do carro
            TextButton(
              child: Text("Adicionar"),
              onPressed: () {
                // Adicionar o novo carro à lista
                if (modelo.isNotEmpty && ano != 0 && imagemUrl.isNotEmpty) {
                  controllerCarros.adicionarCarro(Carro(modelo, ano, imagemUrl));
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class TelaDetalheCarro extends StatelessWidget {
  final Carro carro;
  TelaDetalheCarro(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Carro"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(carro.imagemUrl),
            SizedBox(height: 20),
            Text("Modelo: ${carro.modelo}"),
            Text("Ano: ${carro.ano}"),
          ],
        ),
      ),
    );
  }
}
