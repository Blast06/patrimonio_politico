import 'package:flutter/material.dart';
import 'package:patrimoniopolitico/buttons.dart';
import 'package:patrimoniopolitico/routes/routes.dart';
import 'package:patrimoniopolitico/widgets/custom_drawer.dart';
import 'package:patrimoniopolitico/provider/politicos_provider.dart';

import 'cards.dart';
import 'models/politico_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
final politicosProvider = new PoliticosProvider();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Politico Money',
      initialRoute: 'home',
      routes: getApplicationRoutes(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Inicio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int _counter = 0;
  List<int> ActiveButton = [1, 0, 0, 0];

  //TODO: PREPARAR ESATA DATA PARA CONVERTIRLA DESDE FIREBASE
//  List<Politico> Politicos = new Politico(itemImage, itemName, patrimonio, partido, cargo, imageNumber)


  void changeToValue(int value) {
    setState(() {
      for (int current_value = 0; current_value <
          ActiveButton.length; current_value++) {
        if (current_value == value) {
          ActiveButton[current_value] = 1;
        } else {
          ActiveButton[current_value] = 0;
        }
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      //leaving this for implementation of backend
//      _counter++;
    });
  }

  Color peach = Colors.blue;

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

    return Scaffold(
      key: _drawerKey,
      drawer: CustomDrawer(), //TODO: AGERGAR DRAWER(TOMAR ABOUT,POLITICAS Y DEMAS DE EL DRAWER DE WHATSGROUP
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: one_percent_screen_width * 100,
                height: one_percent_screen_height * 40,
                decoration: BoxDecoration(
                    color: peach,
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(55))),
              ),
            ),
            Positioned(
              top: 10 * one_percent_screen_height,
              left: 4 * one_percent_screen_width,
              child: IconButton(
                iconSize: one_percent_screen_width * 10 ,
                icon:Icon(Icons.menu),
//                size: one_percent_screen_width * 10,
                color: Color.fromRGBO(0, 0, 0, 0.3),
                onPressed: () {
                  _drawerKey.currentState.openDrawer();
                },
              ),
            ),
//            Positioned(
//              top: 19 * one_percent_screen_height,
//              left: 5 * one_percent_screen_width,
//              child: Text(
//                'Elige el politico que quieras y empieza a gastar!',
//                style: TextStyle(
//                    fontSize: 12,
//                    color: Color.fromRGBO(0, 0, 0, 0.3),
//                    fontWeight: FontWeight.w600),
//              ),
//            ),
            Positioned(
              top: 20 * one_percent_screen_height,
              left: 4 * one_percent_screen_width,
              child: Container(
                width: 90 * one_percent_screen_width,
                child: Text('Gasta la fortuna como si fuera',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
                ),
              ),
            ),
//            Positioned(
//              top: 21 * one_percent_screen_height,
//              right: 4 * one_percent_screen_width,
//              child: Icon(Icons.location_on),
//            ),
            Positioned(
              top: 24 * one_percent_screen_height,
              left: 85 * one_percent_screen_width,
              child: Text(
                'Tuya',
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
            ),
            Buttons(
              button_text: "PRD",
              active: ActiveButton[0],
              one_percent_screen_height: one_percent_screen_height,
              one_percent_screen_width: one_percent_screen_width,
              horizontal_padding: 10.0,
              onButtonSelected: () => changeToValue(0),
            ),
            Buttons(
              button_text: "PLD",
              active: ActiveButton[1],
              one_percent_screen_height: one_percent_screen_height,
              one_percent_screen_width: one_percent_screen_width,
              horizontal_padding: 30.0,
              onButtonSelected: () => changeToValue(1),
            ),
            Buttons(
              button_text: "PRM",
              active: ActiveButton[2],
              one_percent_screen_height: one_percent_screen_height,
              one_percent_screen_width: one_percent_screen_width,
              horizontal_padding: 50.0,
              onButtonSelected: () => changeToValue(2),
            ), Buttons(
              button_text: "FP",
              active: ActiveButton[3],
              one_percent_screen_height: one_percent_screen_height,
              one_percent_screen_width: one_percent_screen_width,
              horizontal_padding: 70.0,
              onButtonSelected: () => changeToValue(3),
            ),
            Positioned(
              top: one_percent_screen_height * 38,
              left: one_percent_screen_width * 5,
              width: one_percent_screen_width * 90,
              height: one_percent_screen_height * 60,
              child: Container(
                child: GridView.count(
                  childAspectRatio: 0.6,
                  crossAxisCount: 2,
                  crossAxisSpacing: one_percent_screen_height * 2,
                  children: List.generate(politicosLista.length, (index) {
                    return ItemCard(
                        politicosLista[index].itemImage,
                        politicosLista[index].itemName,
                        politicosLista[index].patrimonio,
                        politicosLista[index].partido,
                        politicosLista[index].cargo,
                        index
                    );
                  }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
