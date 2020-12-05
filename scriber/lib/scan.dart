import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:scriber/pickImage.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  var result = "";
  File _userImageFile;

  recogniseText() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(myImage);
    result = "";
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        setState(() {
          result = result + ' ' + line.text + '\n';
        });
      }
    }
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
                Text(
              'The text in the image is: $result',
            ),
              ],
            ),
          ),
        )
      );
  }
  
}