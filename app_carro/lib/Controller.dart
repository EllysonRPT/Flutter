
import 'package:app_carro/Model.dart';

class CarroController {
  //atributo
  List<Carro> _carroLista = [
    Carro("Fiat Uno",1992,"img/foto1.jpg"),
    Carro("Classic",2012,"img/foto2.jpg")
  ];

  //method
  List<Carro> get listarCarros => _carroLista;
  void adicionarCarro(String modelo, int ano, String imagemUrl) {
    Carro carro = Carro(modelo, ano, imagemUrl);
    _carroLista.add(carro);
  }
}
