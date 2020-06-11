import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:patrimoniopolitico/models/gasto_model.dart';
import 'package:patrimoniopolitico/widgets/mini_card.dart';

import '../models/politico_model.dart';

class SingleItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
//    Politico(args[0], itemName, patrimonio, partido, cargo, imageNumber)
    Politico politico = args;
    Color prin = Colors.amberAccent;
    Color lightb = new Color.fromRGBO(181, 204, 230, 1);
    Color lightred = new Color.fromRGBO(232, 190, 208, 1);
    double one_percent_screen_height =
        MediaQuery.of(context).size.height * 0.01;
    double one_percent_screen_width = MediaQuery.of(context).size.width * 0.01;
    print(args);
    print(politico.cargo);
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: FittedBox(
                child: Container(
                  width: one_percent_screen_width * 100,
                  height: one_percent_screen_height * 45,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/imgs/loading.gif'),
                    image: NetworkImage(politico.itemImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
//            Positioned(
//                top: 45 * one_percent_screen_height,
//                child: FittedBox(
//                  child: Container(
//                    width: one_percent_screen_width * 100,
//                    height: one_percent_screen_height * 70,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.all(Radius.circular(55)),
//                        color: Colors.red),
//                  ),
//                )),
            Positioned(
              top: 46 * one_percent_screen_height,
              left: 35 * one_percent_screen_width,
              child: Text(
                politico.itemName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
//            Positioned(
//              top: 54 * one_percent_screen_height,
//              left: 9 * one_percent_screen_width,
//              child: Text(
//                politico.partido,
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15,
//                    fontWeight: FontWeight.normal),
//              ),
//            ),

            Positioned(
              top: 50 * one_percent_screen_height,
              left: 1 * one_percent_screen_width,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 50 ),
                child: AutoSizeText(
                  politico.patrimonio.toString(),
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Positioned(
              top: 59 * one_percent_screen_height,
              left: -20,
              child: Container(
                width: one_percent_screen_width * 120,
                height: one_percent_screen_height * 0.1,
//                color: Colors.red,
                child: Divider(
                  color: Colors.black,
                  height: 15,
                  thickness: 5,
                  indent: 20,
                  endIndent: 0,
                ),
              ),
            ),
            Positioned(
                top: 59 * one_percent_screen_height,
                left: 5 * one_percent_screen_width,
                child: Center(
                  child: Container(
//                  margin: EdgeInsets.all(20.0),
                    width: one_percent_screen_width * 90,
                    height: one_percent_screen_height * 40,
                    child: GridView.count(
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
                      crossAxisSpacing: one_percent_screen_height,
                      children: List.generate(gastosLista.length, (index) {
                        return MiniCard(
                            gastosLista[index].title,
                            gastosLista[index].image,
                            gastosLista[index].price,
                            Colors.amberAccent);
                      }),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
