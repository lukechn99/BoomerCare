import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

const String kFileName = 'data.json';

class TextIo{
  File _filePath;
  bool _fileExists;

  Map<String, dynamic> json = {"documents":[]};
  String _jsonString;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName');
  }

  Future<Map<String, dynamic>> readJson() async {
    // Initialize _filePath
    _filePath = await _localFile;

    // 0. Check whether the _file exists
    _fileExists = await _filePath.exists();
    print('0. File exists? $_fileExists');

    // If the _file exists->read it: update initialized _json by what's in the _file
    if (_fileExists) {
      try {
        //1. Read _jsonString<String> from the _file.
        _jsonString = await _filePath.readAsString();
        print('1.(_readJson) _jsonString: $_jsonString');

        //2. Update initialized _json by converting _jsonString<String>->_json<Map>
        json = jsonDecode(_jsonString);
        print('2.(_readJson) _json: $json \n - \n');
      } catch (e) {
        // Print exception errors
        print('Tried reading _file error: $e');
        // If encountering an error, return null
      }
    } else {
      writeJson("documents", []);
    }
    return json;
  }

  void addToList(Map<String, dynamic> newDoc) async {
    json["documents"].add(newDoc);
    _jsonString = jsonEncode(json);
    _filePath.writeAsString(_jsonString);
  }

  void writeJson(String key, dynamic value) async {
    // Initialize the local _filePath
    //final _filePath = await _localFile;

    //1. Create _newJson<Map> from input<TextField>
    Map<String, dynamic> _newJson = {key: value};
    print('1.(_writeJson) _newJson: $_newJson');

    //2. Update _json by adding _newJson<Map> -> _json<Map>
    json.addAll(_newJson);
    print('2.(_writeJson) _json(updated): $json');

    //3. Convert _json ->_jsonString
    _jsonString = jsonEncode(json);
    print('3.(_writeJson) _jsonString: $_jsonString\n - \n');

    //4. Write _jsonString to the _filePath
    _filePath.writeAsString(_jsonString);
  }

}