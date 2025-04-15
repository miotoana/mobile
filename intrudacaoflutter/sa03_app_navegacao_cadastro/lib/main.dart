import 'package:flutter/material.dart';

import 'View/Tela_Cadastro.dart';
import 'View/Tela_Confirmacao.dart';
import 'View/Tela_Inicial.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => TelaInicial(),
      "/cadastro": (context) => TelaCadastro(),
      "/confirmacao": (context) => TelaConfirmacao()
    },
    initialRoute: "/",
  ));
}