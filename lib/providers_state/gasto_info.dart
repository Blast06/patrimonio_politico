


import 'package:flutter/foundation.dart';
import 'package:patrimoniopolitico/models/gasto_model.dart';

class GastoInfo with ChangeNotifier{

  List<Gasto> gasto = [];
  Gasto gastos = new Gasto();


  List<Gasto> get allGastos => gastos.getLista();

  aumentar(Gasto gasto, int index) {
//    allGastos[index].cantidad++;
    gasto.cantidad++;
    notifyListeners();
  }

  decrementar(Gasto gasto, int index) {
//    allGastos[index].cantidad = allGastos[index].cantidad < 1 ? 0 : allGastos[index].cantidad--;
    gasto.cantidad = gasto.cantidad < 1 ?  0 : gasto.cantidad--;
    notifyListeners();
  }

}