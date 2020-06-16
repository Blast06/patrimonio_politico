import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patrimoniopolitico/models/gasto_model.dart';

class MiniCard extends StatefulWidget {
  String _title;
  String _image;
  int _price;
  Color _ContainerColor = Colors.amberAccent;

  MiniCard(this._title, this._image, this._price, this._ContainerColor);

  @override
  _MiniCardState createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String price;
    TextEditingController _textEditingController =
        new TextEditingController(text: price);
    double one_percent_screen_height =
        MediaQuery.of(context).size.height * 0.01;
    double one_percent_screen_width = MediaQuery.of(context).size.width * 0.01;
    return FittedBox(
      child: Stack(
        children: <Widget>[
          Container(
            width: one_percent_screen_width * 50,
            height: one_percent_screen_height * 30,
            child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: FadeInImage(
                  placeholder: AssetImage('assets/imgs/loading.gif'),
                  image: NetworkImage(widget._image),
                  fit: BoxFit.cover,
                )),
          ),
          //dark coverlay
//          Container(
//            width: one_percent_screen_width * 40,
//            height: one_percent_screen_height * 35,
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.all(Radius.circular(20)),
//                gradient: (LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    stops: [
//                      0.1,
//                      0.6,
//                      0.8,
//                      0.9
//                    ],
//                    colors: [
//                      Color.fromRGBO(0, 0, 0, 0),
//                      Color.fromRGBO(0, 0, 0, 0.25),
//                      Color.fromRGBO(0, 0, 0, 0.5),
//                      Color.fromRGBO(0, 0, 0, 0.6)
//                    ]))),
////            child: FlatButton(
////              child: Container(),
////              onPressed: () => Navigator.pushNamed(context, 'single_item',
////                  arguments: politicosLista[_ImageNumber]),
////            ),
//
////            child: Widget(),
//          ),
//          Positioned(
//            top: one_percent_screen_height * 25,
//            left: one_percent_screen_width * 4,
//            child: Text(
//              _title,
//              style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 17,
//                  fontWeight: FontWeight.w600),
//            ),
//          ),
//          Positioned(
//            top: one_percent_screen_height * 28,
//            left: one_percent_screen_width * 4,
//            child: Text(
//              _title,
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 14,
//                fontWeight: FontWeight.w300,
//              ),
//            ),
//          ),
//          Positioned(
//            top: one_percent_screen_height * 31,
//            left: one_percent_screen_width * 4.5,
//            child: Text(
//              _title,
//              style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 12,
//                  fontWeight: FontWeight.w400),
//            ),
//          ),
//          Positioned(
//            top: one_percent_screen_height * 31,
//            left: one_percent_screen_width * 15,
//            child: Container(
//              child: Text(
//                _title,
//                overflow: TextOverflow.ellipsis, //
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 12,
//                    fontWeight: FontWeight.w600),
//              ),
//            ),
//          ),
          Positioned(
            top: one_percent_screen_height * 25,
            left: one_percent_screen_width * 5,
            child: Container(
//              margin: EdgeInsets.only(bottom: 30.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 30,
                  ),
//                  TextFormField(
//                    controller: _textEditingController,
//
//                  ),
                  Icon(Icons.add, color: Colors.white, size: 30)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
