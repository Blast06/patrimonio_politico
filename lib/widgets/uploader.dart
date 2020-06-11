import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Uploader extends StatefulWidget {
  final File file;

  const Uploader({Key key, this.file}) : super(key: key);



  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://patrimoniopolitico.appspot.com/');

  StorageUploadTask _uploadTask;

  void _startUpload(){
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_uploadTask != null){

      return StreamBuilder<StorageTaskEvent>(
        stream: _uploadTask.events,
        builder: (context,snapshot){
          var event = snapshot?.data?.snapshot;
          double progressPercent = event != null
          ? event.bytesTransferred / event.totalByteCount
          : 0;

          return Column(
            children: <Widget>[
              if(_uploadTask.isComplete)
                Text('Terminado'),

              LinearProgressIndicator(value: progressPercent,)
            ],
          );
      }
      );


    } else {
      return FlatButton.icon(
          onPressed: _startUpload,
          icon: Icon(Icons.cloud_upload),
          label: Text('Subir imagen'));
    }
    return Container();
  }
}
