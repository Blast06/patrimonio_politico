
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:patrimoniopolitico/provider/politicos_provider.dart';


Politico politicoModelFromJson(String str) => Politico.fromJson(json.decode(str));

String  politicoModelToJson(Politico data) => json.encode(data.toJson());

class Politico with ChangeNotifier{
  String id;
  String itemImage;
  String itemName;
  int patrimonio;
  String partido;
  String cargo;
  bool show = false;

  Politico({
    this.id,
    this.itemImage,
    this.itemName,
    this.patrimonio = 10,
    this.partido,
    this.cargo,
    this.show = false
  });

  List<Politico> politico;
  PoliticosProvider politicosProvider;




  factory Politico.fromJson(Map<String, dynamic> json) => Politico(
    id         : json["id"],
    itemImage  : json["itemImage"],
    itemName   : json["itemName"],
    patrimonio : json['patrimonio'],
    partido    : json['partido'],
    cargo      : json['cargo'],
    show       : json['show'],
  );


  Map<String, dynamic> toJson() =>
      {
//    "id": id,
        "itemImage": itemImage,
        "itemName": itemName,
        "patrimonio": patrimonio,
        "partido": partido,
        "cargo": cargo,
        "show" : show
      };

  Future<List<Politico>> politicosList() async {
    this.politico = await politicosProvider.cargarPoliticos();
    return politico;
  }

  gastarPatrimonio(int index, int cantidad, int precio) {
    this.politico[index].patrimonio -= (cantidad * precio);
    notifyListeners();
  }


}
