import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
 @override
 State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();

 @override
 void dispose() {
 emailController.dispose();
 passwordController.dispose();
 super.dispose();
}

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 backgroundColor: Color(0xFFF0E5EC),
 appBar: AppBar(
 backgroundColor: Color(0xFFD6338B),
 elevation: 0,
 toolbarHeight: 60,
title: Row(
mainAxisAlignment: MainAxisAlignment.end,
 children: [
 Container(
 width: 40,
height: 40,
 color: Color(0xFFC4C4C4),
 ),
],
 ),
 ),
 body: SingleChildScrollView(
 child: Column(
 mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
 crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo horizontalmente
children: [
 Padding(
 padding: const EdgeInsets.only(top: 16.0),
child: Text(
'1° Tela: Tela de login',
 style: TextStyle(
 color: Color(0xFFD6338B),
 fontSize: 16,
 fontWeight: FontWeight.bold,
 ),
 ),
),
 SizedBox(height: 40),
 Text(
 'login',
 style: TextStyle(
 color: Color(0xFFD6338B),
 fontSize: 48,
 fontWeight: FontWeight.bold,
 ),
 ),
 SizedBox(height: 20),
 Container(
 width: 150,
 height: 150,
 decoration: BoxDecoration(
color: Color(0xFFC4C4C4),
shape: BoxShape.circle,
),
 ),
SizedBox(height: 20),
Text(
'entre na sua conta para continuar',
style: TextStyle(
 color: Color(0xFFD6338B),
  fontSize: 14,
 ),
 ),
 SizedBox(height: 40),
 Container(
 width: MediaQuery.of(context).size.width * 0.85,
 padding: EdgeInsets.all(24),
 decoration: BoxDecoration(
 color: Colors.white,
 borderRadius: BorderRadius.circular(20),
 boxShadow: [
 BoxShadow(
 color: Colors.black.withOpacity(0.1),
 blurRadius: 10,
 offset: Offset(0, 5),
 ),
 ],
 ),
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 TextField(
 controller: emailController,
 decoration: InputDecoration(
 hintText: 'seu email:',
 fillColor: Color(0xFFC4C4C4),
 filled: true,
 border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(10),
 borderSide: BorderSide.none,
 ),
 ),
 ),
 SizedBox(height: 20),
TextField(
 controller: passwordController,
 obscureText: true,
 decoration: InputDecoration(
 hintText: 'sua senha:',
 fillColor: Color(0xFFC4C4C4),
 filled: true,
 border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(10),
borderSide: BorderSide.none,
),
),
 ),
 SizedBox(height: 20),
 Align(
 alignment: Alignment.centerRight,
 child: TextButton(
 onPressed: () {
 // ação de esqueceu a senha
 },
 child: Text(
 'esqueceu a senha?',
 style: TextStyle(color: Color(0xFFD6338B)),
 ),
 ),
 ),
 SizedBox(height: 20),
 Center(
 child: SizedBox(
 width: double.infinity,
 child: ElevatedButton(
 style: ElevatedButton.styleFrom(
 backgroundColor: Color(0xFFD6338B),
 padding: EdgeInsets.symmetric(vertical: 16),
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(10),
 ),
 ),
 onPressed: () {
 
 },
 child: Text(
 'entrar',
 style: TextStyle(
 color: Colors.white,
 fontSize: 24,
 fontWeight: FontWeight.bold,
 ),
 ),
 ),
 ),
 ),
 ],
 ),
 ),
 ],
 ),
 ),
 );
 }
}