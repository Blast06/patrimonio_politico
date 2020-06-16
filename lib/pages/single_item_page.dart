import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money2/money2.dart';
import 'package:patrimoniopolitico/models/gasto_model.dart';
import 'package:patrimoniopolitico/widgets/mini_card.dart';
import 'package:patrimoniopolitico/widgets/mini_card2.dart';

import '../models/politico_model.dart';

class SingleItemPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)
        .settings
        .arguments;
    final Currency rd = Currency.create('RD', 0);

    Politico politico = args;
    Color prin = Colors.amberAccent;
    Color lightb = new Color.fromRGBO(181, 204, 230, 1);
    Color lightred = new Color.fromRGBO(232, 190, 208, 1);
    double one_percent_screen_height =
        MediaQuery
            .of(context)
            .size
            .height * 0.01;
    double one_percent_screen_width = MediaQuery
        .of(context)
        .size
        .width * 0.01;
    print(args);
    print(politico.cargo);
    return Scaffold(
        body: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              _crearAppbar(politico, rd),
              SliverList(delegate: SliverChildListDelegate([
                SizedBox(height: 10.0),
                _crearPatrimonio(politico, rd),
                Divider(
                  color: Colors.black,
                  height: 15,
                  thickness: 5,
                  indent: 20,
                  endIndent: 0,
                ),
                _crearGridView(politico, one_percent_screen_height, one_percent_screen_width)

              ]

              ),)

            ],

          ),
        )
    );
  }


  Widget _crearAppbar(Politico politico, Currency rd) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(Money.fromInt(politico.patrimonio, rd).format('###,###,###'), overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.green, fontSize: 16.0)
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/imgs/loading.gif'),
          image: NetworkImage(politico.itemImage),
          fadeInDuration: Duration(milliseconds: 20),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _crearPatrimonio(Politico politico, Currency rd) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: AutoSizeText(
        politico.itemName,
        maxLines: 1,
        style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _crearGridView(Politico politico, double one_percent_screen_height, double one_percent_screen_width) {
    return Center(
          child: Container(
//            color: Colors.red,
                  margin: EdgeInsets.all(10.0),
            width: one_percent_screen_width * 100,
            height: one_percent_screen_height * 100,
            child: GridView.count(
              childAspectRatio: 0.9,
              crossAxisCount: 1,
              crossAxisSpacing: one_percent_screen_height,
              children: List.generate(gastosLista.length, (index) {
                return MiniCard2(
                  gastosLista[index].title,
                  gastosLista[index].image,
                  gastosLista[index].price,
                  Colors.amberAccent
                );
              }),
            ),
          ),
        );

  }

}
//
//Positioned(
//top: 0,
//child: FittedBox(
//child: Container(
//width: one_percent_screen_width * 100,
//height: one_percent_screen_height * 45,
//child: FadeInImage(
//placeholder: AssetImage('assets/imgs/loading.gif'),
//image: NetworkImage(politico.itemImage),
//fit: BoxFit.cover,
//),
//),
//),
//),
//Positioned(
//top: 46 * one_percent_screen_height,
//left: 35 * one_percent_screen_width,
//child: Text(
//politico.itemName,
//style: TextStyle(
//color: Colors.black,
//fontSize: 25,
//fontWeight: FontWeight.bold),
//),
//),
//
//


//
//Positioned(
//top: 59 * one_percent_screen_height,
//left: -20,
//child: Container(
//width: one_percent_screen_width * 120,
//height: one_percent_screen_height * 0.1,
////                color: Colors.red,

//),
//),
