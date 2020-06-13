import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patrimoniopolitico/pages/single_item_page.dart';

import 'models/politico_model.dart';

class ItemCard extends StatelessWidget {
  String _ItemImage;
  String _ItemName;
  int _Patrimonio;
  String _Partido;
  String _Cargo;
//  int _ImageNumber;

  ItemCard(this._ItemImage, this._ItemName, this._Patrimonio, this._Partido,
      this._Cargo);

  @override
  Widget build(BuildContext context) {
    double one_percent_screen_height =
        MediaQuery.of(context).size.height * 0.01;
    double one_percent_screen_width = MediaQuery.of(context).size.width * 0.01;
    return FittedBox(
      child: Stack(
        children: <Widget>[
          Container(
            width: one_percent_screen_width * 40,
            height: one_percent_screen_height * 35,
            child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: FadeInImage(
                  placeholder: AssetImage('assets/imgs/loading.gif'),
                  image: NetworkImage(_ItemImage),
                  fit: BoxFit.cover,
                )),
          ),
          //dark coverlay
          Container(
            width: one_percent_screen_width * 40,
            height: one_percent_screen_height * 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: (LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.1,
                      0.6,
                      0.8,
                      0.9
                    ],
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0),
                      Color.fromRGBO(0, 0, 0, 0.25),
                      Color.fromRGBO(0, 0, 0, 0.5),
                      Color.fromRGBO(0, 0, 0, 0.6)
                    ]))),
//            child: FlatButton(
//              child: Container(),
//              onPressed: () => Navigator.pushNamed(context, 'single_item',
//                  arguments: politicosLista[_ImageNumber]),
//            ),

//            child: Widget(),
          ),
          Positioned(
            top: one_percent_screen_height * 25,
            left: one_percent_screen_width * 4,
            child: Text(
              _ItemName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: one_percent_screen_height * 28,
            left: one_percent_screen_width * 4,
            child: Text(
              _Patrimonio.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Positioned(
            top: one_percent_screen_height * 31,
            left: one_percent_screen_width * 4.5,
            child: Text(
              _Partido,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
            top: one_percent_screen_height * 31,
            left: one_percent_screen_width * 15,
            child: Container(
              child: Text(
                _Cargo,
                overflow: TextOverflow.ellipsis, //TODO: ARREGLAR ESTO QUE LOS TEXTOS LARGOS PONGAN PUNTITOS ASI: ....
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
