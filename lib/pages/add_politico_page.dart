import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patrimoniopolitico/models/politico_model.dart';
import 'package:patrimoniopolitico/utils/utils.dart' as utils;
import 'package:patrimoniopolitico/provider/politicos_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';


//import 'package:firebase/firebase.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart' as fb;

class AddPoliticoPage extends StatefulWidget {
  @override
  _AddPoliticoPageState createState() => _AddPoliticoPageState();
}

class _AddPoliticoPageState extends State<AddPoliticoPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  Politico politico = new Politico();
  final politicoProvider = new PoliticosProvider();
  bool _guardando = false;
  File imagen;
  String uploadImageUrl;

  @override
  Widget build(BuildContext context) {
    final Politico prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      politico = prodData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Politico'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearPartido(),
                _crearCargo(),
                _crearDisponible(),
                _crearBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: politico.itemName,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => politico.itemName = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Mas de 3 caracteres';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: politico.patrimonio.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Patrimonio'),
      onSaved: (value) => politico.patrimonio = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearPartido() {
    return TextFormField(
      initialValue: politico.partido,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Partido'),
      onSaved: (value) => politico.partido = value,
//      validator: (value) {
//        if (value.length < 3) {
//          return 'Mas de 3 caracteres';
//        } else {
//          return null;
//        }
//      },
    );
  }

  Widget _crearCargo() {
    return TextFormField(
      initialValue: politico.cargo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Cargo'),
      onSaved: (value) => politico.cargo = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Mas de 3 caracteres';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: politico.show,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        politico.show = value;
      }),
    );
  }

  Widget _crearBtn() {
    String txt = 'Agregar';
    if (politico.id != null) {
      txt = 'Actualizar';
    }
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      icon: Icon(Icons.save),
      label: Text(txt),
      onPressed: _submit,

    );
  }

  //TODO: mandar false siempre el show/disponible
  void _submit() async{
    // si el form no es valido retorna alertas en los textfield con los hintErrors
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    if (politico.id == null) {
      politico.itemImage = await _subirImagen(imagen, politico.itemName);
      politicoProvider.agregarPolitico(politico);
      Navigator.pushReplacementNamed(context, 'home');
//      mostrarSnackbar('Creado exitosamente');
      setState(() {
      });
      formKey.currentState.reset();
    } else {
//      politicoProvider.editarProducto(politico);
//      mostrarSnackbar('Editado exitosamente');
      formKey.currentState.reset();
    }
//    Navigator.pushReplacementNamed(context, 'home');
  }

  void mostrarSnackbar(String msj, bool show) {
    scaffoldKey.currentState.showSnackBar(
        new SnackBar(content:
        new Row(
          children: <Widget>[
            if(show)new CircularProgressIndicator(),
             new Text("  $msj")
          ],
        ),
        ));
//    _handleSignIn()
//        .whenComplete(() =>
//        Navigator.of(context).pushNamed("/Home")
//    );
  }



  _mostrarFoto() {
    if (politico.itemImage != null) {
      return Container();
    } else {
      if (imagen != null) {
        return Image.file(
          imagen,
          fit: BoxFit.cover,
          height: 300.00,
        );
      }
      return Image.asset('assets/imgs/drawer.jpg');
    }
  }

  _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async {
    imagen = await ImagePicker.pickImage(source: origen);

    if (imagen != null) {}
    setState(() {});
  }


  Future _subirImagen(File imagen, String imageName) async {

    fb.StorageReference storageReference = fb.FirebaseStorage.instance
        .ref()
        .child('politicos/$imageName${DateTime.now()}');
    fb.StorageUploadTask uploadTask = storageReference.putFile(imagen);

    if( uploadTask.isInProgress){
      print('is in progress');
    }
    while(uploadTask.isInProgress){
      print('ins in progress');
      mostrarSnackbar("Subiendo..",true);
      await uploadTask.onComplete;
      mostrarSnackbar("Listo..",false);
      print('File uploaded');

    }

    uploadImageUrl = await storageReference.getDownloadURL();

    return uploadImageUrl;
  }
}
