import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:scriber/pickImage.dart';
import 'package:scriber/textio.dart';

const String kFileName = 'data.json';

class ScanScreen extends StatefulWidget {
  String title = "Scan in a record";

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  var result = "";
  File _userImageFile;
  TextIo model;

  @override
  void initState()  {
    super.initState();
    // Instantiate _controllerKey and _controllerValue
    model = new TextIo();
    print('0. Initialized _json: ${model.json}');
    model.readJson();
  }

  recogniseText() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
    TextRecognizer recognizeText = FirebaseVision.instance.cloudTextRecognizer();
    VisionText readText = await recognizeText.processImage(myImage);
    result = "";
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        setState(() {
          result = result + ' ' + line.text + '\n';
        });
      }
    }
    Map<String, dynamic> document = {"title" : readText.blocks[0].text, "content": result};
    model.addToList(document);
  }

  void _pickedImage(File image) {
    _userImageFile = image;
    recogniseText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                UserImagePicker(_pickedImage),
                Padding(
                    padding: const EdgeInsets.all(16.0), child: Text(result)),
              ],
            ),
          ),
        ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      )
      );
  }
  
}