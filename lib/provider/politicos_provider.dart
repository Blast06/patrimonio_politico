import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:patrimoniopolitico/models/politico_model.dart';


class PoliticosProvider extends ChangeNotifier{

  final _url = 'https://patrimoniopolitico.firebaseio.com';
  final List<Politico> politicos = [];



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

    return politicos;

  }



}