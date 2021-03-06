import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:patrimoniopolitico/models/politico_model.dart';


class PoliticosProvider extends ChangeNotifier{

  final _url = 'https://patrimoniopolitico.firebaseio.com';
  final List<Politico> politicos = [];
  bool showLoading = true;


  PoliticosProvider(){
//    print('empezo');
//    this.cargarPoliticos();
//    print('termino');
  }

  Future<bool> agregarPolitico(Politico politico) async {

    final url = '$_url/politicos.json';

    final resp = await http.post(url, body: politicoModelToJson(politico));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }

  Future<List<Politico>> cargarPoliticos() async{

    final String url = '$_url/politicos.json';

    final resp = await http.get(url);

    final Map<String,dynamic>decodedData = json.decode(resp.body);

    if(decodedData == null) return [];


    decodedData.forEach( (id,poli){
      final poliTemp = Politico.fromJson(poli);
      poliTemp.id = id;

      politicos.add(poliTemp);

    });
    print('termino2');
    print(politicos.length);
    showLoading = false;
    return politicos;

  }

  gastarPatrimonio(int index, int amount, int precio) {

    final int cantidad = amount + 1;
    int totalArestar = 0;

    if(cantidad < 2){
      this.politicos[index].patrimonio -= (cantidad * precio);

    } else {
      totalArestar = (precio * cantidad) - precio * (cantidad -1);
      this.politicos[index].patrimonio -= totalArestar;
    }

    notifyListeners();
  }

  restaurarPatrimonio(int index, int amount, int precio){
    final int cantidad = amount + 1;

    int totalAsumar = 0;
    if(amount <1 ) return;

    totalAsumar = (precio * cantidad) - precio * (cantidad -1);
    this.politicos[index].patrimonio += totalAsumar;

  }


}