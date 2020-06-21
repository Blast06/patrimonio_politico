




import 'package:flutter/material.dart';

class Gasto with ChangeNotifier{
  String title;
  String image;
  int price;

  Gasto(this.title, this.image, this.price);



}

final gastosLista = <Gasto> [
  new Gasto('Avion', 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', 500000),
  new Gasto('Avion', 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', 500000),
  new Gasto('Avion', 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', 500000),
  new Gasto('Avion', 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', 500000),
  new Gasto('Avion', 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', 500000),
  new Gasto('Avion', 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', 500000),
  new Gasto('Avion', 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', 500000),
  new Gasto('Avion', 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', 500000),
  new Gasto('Avion', 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', 500000),
];


