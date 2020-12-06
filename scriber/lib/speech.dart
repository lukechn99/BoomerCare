/*
 * This is a collection of methods to be used as a listener
 */
library speech_lib;

import 'dart:async';
import 'dart:math';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/material.dart';

// stt.SpeechStatusListener statusListener;
// stt.SpeechErrorListener errorListener;
// stt.SpeechToText speech = stt.SpeechToText();
// bool available = await speech.initialize( onStatus: statusListener, onError: errorListener );
// if ( available ) {
//     speech.listen( onResult: resultListener );
// }
// else {
//     print("The user has denied the use of speech recognition.");
// }
// // some time later...
// speech.stop()

class Listener {
  /// instance of the listener object. Only one is needed and
  /// calls to listen are made to this object
  Listener();

  /// init
  Future<void> initSpeechState() async {
    bool initStatus = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    initStatus_ = initStatus;
  }

  /// start listen
  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: _currentLocaleId,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
  }

  /// stop listen
  void stopListening() {
    speech.stop();
    level = 0.0;
  }

  /// cancel listen
  void cancelListening() {
    speech.cancel();
    level = 0.0;
  }

  /// listeners are used through the speech functions to update
  /// 'lastWords', 'lastStatus', and 'lastError' which keeps track
  /// of what happened in the last listening session
  void resultListener(SpeechRecognitionResult result) {
    lastWords = "${result.recognizedWords} - ${result.finalResult}";
  }

  void statusListener(String status) {
    lastStatus = "$status";
  }

  void errorListener(SpeechRecognitionError error) {
    lastError = lastError = "${error.errorMsg} - ${error.permanent}";
  }

  /// SpeechToText only needs to be initialized once
  final SpeechToText speech = SpeechToText();

  /// true when initialized
  bool initStatus_ = false;
  double level = 0.0;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  // double minSoundLevel = 50000;
  // double maxSoundLevel = -50000;
}
