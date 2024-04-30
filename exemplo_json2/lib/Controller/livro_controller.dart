import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import '../Model/livro_model.dart';

class LivroController {
  List<Livro> livros = [];

  Future<List<Livro>> loadLivro() async {
    final data = await rootBundle.loadString("assets/livros.json");
    final jsonList = json.decode(data) as List<dynamic>;
    livros.clear();
    livros.addAll(jsonList.map((e) => Livro.fromJson(e)));

    return livros;
  }
}
