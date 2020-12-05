/*
 * This is a collection of methods to be used as a listener
 */
import 'dart:async';
import 'dart:math';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

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
  Listener();

  /// init
  Future<void> initSpeechState() async {
    initStatus = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
  }

  /// SpeechToText only needs to be initialized once
  final SpeechToText speech = SpeechToText();

  /// true when initialized
  bool initStatus;
  SpeechStatusListener statusListener;
  SpeechErrorListener errorListener;
}

/// method starts recording
