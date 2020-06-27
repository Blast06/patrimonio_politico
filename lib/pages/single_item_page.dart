import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money2/money2.dart';
import 'package:patrimoniopolitico/models/gasto_model.dart';
import 'package:patrimoniopolitico/providers_state/gasto_info.dart';
import 'package:patrimoniopolitico/widgets/mini_card.dart';
import 'package:patrimoniopolitico/widgets/mini_card2.dart';
import 'package:provider/provider.dart';

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
//    final politico = Provider.of<Politico>(context);
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

    return Scaffold(
        body: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              _crearAppbar(politico, rd),
              SliverList(delegate: SliverChildListDelegate([
                SizedBox(height: 10.0),
                _crearPatrimonio(politico, rd, context),
                Divider(
                  color: Colors.black,
                  height: 15,
                  thickness: 5,
                  indent: 20,
                  endIndent: 0,
                ),
                _crearGridView(politico, one_percent_screen_height, one_percent_screen_width, context)
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
      expandedHeight: 400.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          color: Colors.green,
          child: Text(Money.fromInt(politico.patrimonio, rd).format('###,###,###'), overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black54, fontSize: 16.0)
          ),
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

  Widget _crearPatrimonio(Politico politico, Currency rd, BuildContext context) {
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

  Widget _crearGridView(Politico politico, double one_percent_screen_height, double one_percent_screen_width, BuildContext context){
//    final gastos = Provider.of<GastoInfo>(context).allGastos;
    return Center(
      child: Container(
//            color: Colors.red,
        margin: EdgeInsets.all(5.0),
        width: one_percent_screen_width * 100,
        height: one_percent_screen_height * 100,
        child: GridView.count(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          crossAxisSpacing: one_percent_screen_height,
          children: List.generate(Provider.of<GastoInfo>(context).allGastos.length, (index) {
            return MiniCard2(
                Provider.of<GastoInfo>(context).allGastos[index].title,
                Provider.of<GastoInfo>(context).allGastos[index].image,
                Provider.of<GastoInfo>(context).allGastos[index].price,
                Colors.amberAccent,
                Provider.of<GastoInfo>(context).allGastos[index].cantidad,
                index
            );
          }),
        ),
      ),
    );

  }

}


