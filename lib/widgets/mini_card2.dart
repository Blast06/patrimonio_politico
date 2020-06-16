import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrimoniopolitico/models/gasto_model.dart';


class MiniCard2 extends StatefulWidget {

  String _title;
  String _image;
  int _price;
  Color _ContainerColor = Colors.amberAccent;

  MiniCard2(this._title, this._image, this._price, this._ContainerColor);
  @override
  _MiniCard2State createState() => _MiniCard2State();
}

class _MiniCard2State extends State<MiniCard2> {
  var color = 0xff453658;

  @override
  Widget build(BuildContext context) {
    return Container(
//              margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Color(color), borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            widget._image,
            width: 42,
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            widget._title,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget._price.toString(),
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white38,
                    fontSize: 10,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            widget._title,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
