


import 'package:flutter/foundation.dart';
import 'package:patrimoniopolitico/models/gasto_model.dart';

class GastoInfo with ChangeNotifier{

  List<Gasto> _lista = gastosLista;


  List<Gasto> get allGastos {
    return _lista;
  }
  set lista(List<Gasto> x) {
    this._lista = x;

  }
// get allGastos => gastosLista;


  aumentar(int index) {
//    this.allGastos[index].cantidad++;
    ++this._lista[index].cantidad;
//    gasto.cantidad++;
    notifyListeners();
  }

  decrementar(int index) {
    if(this._lista[index].cantidad < 1) return;
    --this._lista[index].cantidad;

//    this._lista[index].cantidad = this._lista[index].cantidad == 0 ?? this._lista[index].cantidad--;
//    this.allGastos[index].cantidad = this.allGastos[index].cantidad < 1 ? 0 : this.allGastos[index].cantidad--;
//    gasto.cantidad = gasto.cantidad < 1 ?  0 : gasto.cantidad--;
    notifyListeners();
  }

}