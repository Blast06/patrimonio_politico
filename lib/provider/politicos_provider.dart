import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:patrimoniopolitico/models/politico_model.dart';


class PoliticosProvider {

  final _url = 'https://patrimoniopolitico.firebaseio.com';


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
    final List<Politico> politicos = new List();

    if(decodedData == null) return [];

    // foreach barre cada id(el id raro que esta al tope de cada politico, ver video 218 de curso de flutter de fernando en minuto 7:00) y el poli es cada politico
    decodedData.forEach( (id,poli){
      final poliTemp = Politico.fromJson(poli);
      poliTemp.id = id;

      politicos.add(poliTemp);

    });

    return politicos;

  }



}