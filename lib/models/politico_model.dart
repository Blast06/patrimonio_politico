
import 'dart:convert';


Politico politicoModelFromJson(String str) => Politico.fromJson(json.decode(str));

String  politicoModelToJson(Politico data) => json.encode(data.toJson());

class Politico {
  String id;
  String itemImage;
  String itemName;
  int patrimonio;
  String partido;
  String cargo;
  bool show = false;
  int imageNumber;

  Politico({
    this.id,
    this.itemImage,
    this.itemName,
    this.patrimonio,
    this.partido,
    this.cargo,
    this.imageNumber,
    this.show = false
  });



  factory Politico.fromJson(Map<String, dynamic> json) => Politico(
    id         : json["id"],
    itemImage  : json["itemImage"],
    itemName   : json["itemName"],
    patrimonio : json['patrimonio'],
    partido    : json['partido'],
    cargo      : json['cargo'],
    show       : json['show'],
    imageNumber: json['cargo'],
  );


  Map<String, dynamic> toJson() =>
      {
//    "id": id,
        "itemImage": itemImage,
        "itemName": itemName,
        "patrimonio": patrimonio,
        "partido": partido,
        "carto": cargo,
        "show" : show
      };

}
final politicosLista = <Politico> [
//  new Politico(itemImage:"https://www.sincortapisa.com/wp-content/uploads/2020/03/gonzalo-castillo-800x445.jpg", itemName:"Gonzalo", patrimonio"500,000,000", partido:"PLD", cargo:"Candidato-MOPC", imageNumber: 1,show:true),
  new Politico(id:"1",itemImage:"https://i.ytimg.com/vi/bRWe550thOE/maxresdefault.jpg", itemName:"Felix Bautista", patrimonio:120000000000, partido:"PLD", cargo:"Senador", imageNumber: 6, show: true),
  new Politico(id:"2",itemImage:"https://i.ytimg.com/vi/bRWe550thOE/maxresdefault.jpg",itemName:"Julio",patrimonio:12000000,partido:"PRD",cargo:"Consul",imageNumber: 7,show: true),
  new Politico(id:"3",itemImage:"https://i.ytimg.com/vi/bRWe550thOE/maxresdefault.jpg",itemName:"Julio",patrimonio:12000000,partido:"PRD",cargo:"Consul",imageNumber: 8,show: true),
  new Politico(id:"4",itemImage:"https://i.ytimg.com/vi/bRWe550thOE/maxresdefault.jpg",itemName:"Julio",patrimonio:12000000,partido:"PRD",cargo:"Consul",imageNumber: 9,show: true),
  new Politico(id:"5",itemImage:"https://i.ytimg.com/vi/bRWe550thOE/maxresdefault.jpg",itemName:"Julio",patrimonio:12000000,partido:"PRD",cargo:"Consul",imageNumber: 10,show: true),
  new Politico(id:"6",itemImage: "https://www.sincortapisa.com/wp-content/uploads/2020/03/gonzalo-castillo-800x445.jpg",itemName: "Gonzalo", patrimonio: 50000000,partido: "PLD", cargo: "Candidato",imageNumber: 11,show: true ),
  new Politico(id:"7",itemImage: "https://www.65ymas.com/uploads/s1/63/52/4/bigstock-airplane-interior-32492834_1_621x621.jpeg",itemName: "jopo", patrimonio: 50000000,partido: "PLD", cargo: "Candidato",imageNumber: 12,show: true ),


];
