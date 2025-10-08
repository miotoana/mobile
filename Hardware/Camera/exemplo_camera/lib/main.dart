import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(MaterialApp(
    home: ImageScreen(),
  ));
}

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  //instalar a biblioteca image_picker
  File? _image; // obj para armazenar informações de um arquivo do dispositivo
  final ImagePicker _picker = ImagePicker();

  // método para captura de imagem pela camera
  void _getImageFromCamera() async{
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    // verifica se a img n é nula
    if(pickedFile != null){
      setState(() {
        //tranfere o caminho da img
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}