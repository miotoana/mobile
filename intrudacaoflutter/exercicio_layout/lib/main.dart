import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    //routes - rotas de navegação +1 tela
  ));
}

//Janela para estudo de Layout (Colums,Rows,Stacks,Containers)
class MyApp extends StatelessWidget{
  //Sobrescrever o método build
  @override
  Widget build(BuildContext context){
    return Scaffold( //suporte da Janela (appbar, body, bottonNB, drawer)
      appBar: AppBar(title:Text("Exemplo de Layout")),
      body: Container(
        color: const Color.fromARGB(255, 169, 200, 215),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.black,
                  height: 300,
                  width: 300,
                ),
                Container(
                  color: const Color.fromARGB(255, 200, 93, 93),
                  height: 280,
                  width: 280,
                ),
                 Image.asset("assests/img/flora.png",
            height: 300,
            width: 300,
            fit: BoxFit.cover,)
              ],
            ), // Stack
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: const Color.fromARGB(255, 107, 181, 110),
                  height: 135,
                  width: 135,
                ),
                Container(
                  color: const Color.fromARGB(255, 107, 181, 110),
                  height: 135,
                  width: 135,),
                Container(
                  color: const Color.fromARGB(255, 107, 181, 110),
                  height: 135,
                  width: 135,)
              ],
            ),// Row
            Text("Observações Importantes")
          ]), // Column
      ),
    );
  }
}