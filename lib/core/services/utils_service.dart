

import 'dart:convert';
import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<String> pickAndConvertImage()async{
    final picker= ImagePicker();
    final pickedFile= await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null){
      return "";
    }

    final imageFile= File(pickedFile.path);
    final imageBytes= await imageFile.readAsBytes();
    final base64Image= base64Encode(imageBytes);
    return base64Image;
  }
  // final FlutterTts flutterTts = FlutterTts();
  //
  // Future<void> speak(String text) async {
  //   await flutterTts.setLanguage("en-US");
  //   await flutterTts.setSpeechRate(0.65);
  //   await flutterTts.speak(text);
  // }
}


