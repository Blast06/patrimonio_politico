import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrimoniopolitico/models/gasto_model.dart';
import 'package:patrimoniopolitico/models/politico_model.dart';
import 'package:patrimoniopolitico/provider/politicos_provider.dart';
import 'package:patrimoniopolitico/providers_state/gasto_info.dart';
import 'package:patrimoniopolitico/providers_state/gasto_info.dart';
import 'package:patrimoniopolitico/providers_state/politicos.info.dart';
import 'package:provider/provider.dart';


class MiniCard2 extends StatefulWidget {

  String _title;
  String _image;
  int _price;
  Color _ContainerColors = Colors.amberAccent;
  int cantidad;
  int index;
  int indexPolitico;


  MiniCard2(this._title, this._image, this._price, this._ContainerColors, this.cantidad, this.index, this.indexPolitico);
  @override
  _MiniCard2State createState() => _MiniCard2State();
}

class _MiniCard2State extends State<MiniCard2> {
  var color = 0xff453658;

  @override
  Widget build(BuildContext context) {
    final gastos = Provider.of<GastoInfo>(context);

    final politico = Provider.of<PoliticosProvider>(context);

    return Container(
              margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: Color(color), borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            gastos.allGastos[widget.index].image,
            width: 50,
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            gastos.allGastos[widget.index].title,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            gastos.allGastos[widget.index].price.toString(),
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(onTap:(){
                //TODO: OPERACION DE GASTAR PATRIMONIO VA AQUI
                politico.restaurarPatrimonio(widget.indexPolitico, gastos.allGastos[widget.index].cantidad, gastos.allGastos[widget.index].price);
                gastos.decrementar(widget.index);
                },child: Container(color: Colors.amberAccent,child: Icon(Icons.remove, color: Colors.white, size: 27))),
              Text(gastos.allGastos[widget.index].cantidad.toString(),style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.white54))),
              GestureDetector(onTap:(){
                //TODO: OPERACION DE GASTAR PATRIMONIO VA AQUI
                politico.gastarPatrimonio(widget.indexPolitico, gastos.allGastos[widget.index].cantidad, gastos.allGastos[widget.index].price);
                gastos.aumentar(widget.index);
              },child: Container(color: Colors.amberAccent,child: Icon(Icons.add, color: Colors.white, size: 27))),
            ],
          ),
        ],
      ),
    );
  }

  gastarPatrimonio(BuildContext context, int indexPolitico, int cantidad, int precio) {
    Provider.of<Politico>(context).gastarPatrimonio(indexPolitico, cantidad, precio);
  }
//acciones de botones
  restar( int index) {
    print('prueba');
    Provider.of<GastoInfo>(context).decrementar(index);
  }

  aumentar(Gasto gasto, int index) {
    Provider.of<GastoInfo>(context).aumentar(index);

  }
}
