import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Buttons extends StatelessWidget {
  final double one_percent_screen_height;
  final double one_percent_screen_width;
  final double horizontal_padding;
  final String button_text;
  final int active;
  Color backgroundColor;
  Color txtColor;
  final VoidCallback onButtonSelected;

  Buttons({Key key,
    this.horizontal_padding,
    this.one_percent_screen_height,
    this.one_percent_screen_width,
    this.button_text,
    this.active,
    this.onButtonSelected
  }){
    if(this.active == 1){
      backgroundColor = Color.fromRGBO(0, 0, 0, 0.3);
      txtColor = Colors.white;
    } else{
      txtColor = Color.fromRGBO(0, 0, 0, 0.3);
      backgroundColor = Colors.transparent;

    }
  }


  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: 32 * one_percent_screen_height,
      left:  horizontal_padding * one_percent_screen_width,
      child: FlatButton(
        onPressed: () => onButtonSelected(),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          width: one_percent_screen_width * 22,
          height: one_percent_screen_height * 4.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: backgroundColor
          ),
          child: Center(
            child: Text(button_text, style: TextStyle(color: txtColor, fontSize: 16, fontWeight: FontWeight.w700),
             textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
