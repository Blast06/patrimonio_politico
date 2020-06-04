import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  String _title;
  String _image;
  int _price;
  Color _ContainerColor = Colors.amberAccent;

  MiniCard(this._title, this._image, this._price, this._ContainerColor);

  @override
  Widget build(BuildContext context) {
    double one_percent_screen_height =
        MediaQuery
            .of(context)
            .size
            .height * 0.01;
    double one_percent_screen_width = MediaQuery
        .of(context)
        .size
        .width * 0.01;
    return Container(
      margin: EdgeInsets.all(4.0),
      // uso el width para asegurarme de que sea cuadrado
      width: 20 * one_percent_screen_width,
      height: 28 * one_percent_screen_width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        color: _ContainerColor,
      ),
      child: Column(
        children: <Widget>[
          Center(
              child: OverflowBox(
                child: FadeInImage(
                  height: 100,
                  width: one_percent_screen_width * 40,
                  image: NetworkImage(_image),
                  placeholder: AssetImage('assets/imgs/loading.gif'),

                ),
              )
          ),
          Center(
            child: Text(
              _title,
              textAlign: TextAlign.center,
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
