import 'package:flutter/material.dart';

class Gasto extends ChangeNotifier{
  String title;
  String image;
  int price;
  int cantidad = 0;

  Gasto({
    this.title,
    this.image,
    this.price,
    int cantidad = 0
     });


  List<Gasto> getLista() {
    return gastosLista;
  }

  aumentar() {
    cantidad++;
    notifyListeners();
  }

  decrementar() {
    cantidad = cantidad < 1 ?  0 : cantidad--;
    notifyListeners();
  }

}

final gastosLista = <Gasto> [
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500000, cantidad: 0),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500000, cantidad: 0),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500000, cantidad: 0),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500000, cantidad: 0),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500000, cantidad: 0),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500000, cantidad: 0),

];


