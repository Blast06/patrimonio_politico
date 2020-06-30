
import 'package:flutter/foundation.dart';
import 'package:patrimoniopolitico/models/politico_model.dart';
import 'package:patrimoniopolitico/provider/politicos_provider.dart';
import 'package:provider/provider.dart';

class PoliticosInfo with ChangeNotifier{
  PoliticosProvider politicosProvider;
  List<Politico> _politicos;


  Future<List<Politico>> politicosList() async {
    this._politicos = await politicosProvider.cargarPoliticos();
    return _politicos;
  }


  gastarPatrimonio(int index, int cantidad, int precio) {
    this._politicos[index].patrimonio -= (cantidad * precio);
    notifyListeners();
  }



}