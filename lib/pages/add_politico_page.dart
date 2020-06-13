import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patrimoniopolitico/models/politico_model.dart';
import 'package:patrimoniopolitico/utils/utils.dart' as utils;
import 'package:patrimoniopolitico/provider/politicos_provider.dart';

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
      txt = 'Update';
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

  void _submit() async{
    // si el form no es valido
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    if (politico.id == null) {
      politico.itemImage = await _subirImagen(imagen, politico.itemName);
      politicoProvider.agregarPolitico(politico);

      mostrarSnackbar('Creado exitosamente');
      print("prueba");
    } else {
//      politicoProvider.editarProducto(politico);
      mostrarSnackbar('Editado exitosamente');
    }
//    Navigator.pushReplacementNamed(context, 'home');
  }

  void mostrarSnackbar(String msj) {
    final snackbar = SnackBar(
      content: Text(msj),
      duration: Duration(milliseconds: 1500),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
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

  // subir imagen con plugin problematico
//  Future<Uri> _subirImagen(File imagen, String imageName) async {
//    fb.StorageReference storageReference = fb.storage().ref('politicos/$imageName${DateTime.now().toString()}');
//    fb.UploadTaskSnapshot uploadTaskSnapshot = await storageReference.put(imagen).future;
//
//    Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
//    print(imageUri);
//    return imageUri;
//  }

  //TODO IMPLEMENTAR UN LOADING SPINNER al presionar
  Future _subirImagen(File imagen, String imageName) async {

    fb.StorageReference storageReference = fb.FirebaseStorage.instance
        .ref()
        .child('politicos/$imageName${DateTime.now()}');
    fb.StorageUploadTask uploadTask = storageReference.putFile(imagen);

    if(uploadTask.isInProgress) {
      return StreamBuilder(
        stream: uploadTask.events,
        builder: (context, snapshot){
          var event = snapshot?.data?.snapshot;
          double progressPercent = event != null
              ? event.bytesTransferred / event.totalByteCount
              : 0;
          return Column(
            children: <Widget>[
              if(uploadTask.isComplete)
                Text('Terminado'),
              LinearProgressIndicator(value: progressPercent,)
            ],
          );
        },
      );
    }
    await uploadTask.onComplete;

    print('File uploaded');

//    storageReference.getDownloadURL().then((fileUrl) {
//      setState(() {
//        uploadImageUrl = fileUrl;
//        print("prueba de url $uploadImageUrl");
//        //TODO PROBAR SI SE GUARDA LA URL DE LA IMAGEN EN EL ATRIBUTO ITEMIMAGE
//      });
//    });

    uploadImageUrl = await storageReference.getDownloadURL();

    return uploadImageUrl;
  }
}
