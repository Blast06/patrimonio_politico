import 'package:flutter/material.dart';

class Gasto{
  String title;
  String image;
  int price;
  int cantidad;

  Gasto({
    this.title,
    this.image,
    this.price,
    this.cantidad
     });

}

final gastosLista = <Gasto> [
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500001, cantidad: 1),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500002, cantidad: 2),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500003, cantidad: 3),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500004, cantidad: 4),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500005, cantidad: 5),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500006, cantidad: 6),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500007, cantidad: 7),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500008, cantidad: 8),
  new Gasto(title:'Avion',image: 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/avion.jpg?itok=lUmfOzv5', price: 500009, cantidad: 9),

];


