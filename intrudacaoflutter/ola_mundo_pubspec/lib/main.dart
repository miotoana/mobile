import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp()); //class
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo de PubSpec")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Olá Mundo",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,);
            },
            child: Text("Aperte Aqui!!!"),
          ),
        ),
      ),
    );
  }
}
