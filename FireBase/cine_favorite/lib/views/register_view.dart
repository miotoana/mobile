import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cor de fundo principal
      backgroundColor: Color(0xFFF0E5EC),
      
      // AppBar personalizada
      appBar: AppBar(
        backgroundColor: Color(0xFFD6338B), // Cor do topo, um rosa mais escuro
        elevation: 0,
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Retângulo à esquerda
            Container(
              width: 40,
              height: 40,
              color: Color(0xFFC4C4C4),
            ),
            // Círculo à direita
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
      
      // Corpo da tela
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Título "crie sua conta"
            Text(
              'crie sua conta',
              style: TextStyle(
                color: Color(0xFFD6338B),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            
            // Subtítulo
            Text(
              'junte-se a nós para ter acesso a varios filmes',
              style: TextStyle(
                color: Color(0xFFD6338B),
                fontSize: 14,
              ),
            ),
            SizedBox(height: 40),
            
            // Container branco com os campos de texto
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
                  // Campo "seu nome:"
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'seu nome:',
                      fillColor: Color(0xFFC4C4C4),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Campo "seu email:"
                  TextField(
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
                  
                  // Campo "crie uma senha:"
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'crie uma senha:',
                      fillColor: Color(0xFFC4C4C4),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Link "Já tem uma conta? Faça login"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Já tem uma conta?',
                  style: TextStyle(color: Color(0xFFD6338B)),
                ),
                TextButton(
                  onPressed: () {
                    // Ação para navegar para a tela de login
                  },
                  child: Text(
                    'Faça login',
                    style: TextStyle(
                      color: Color(0xFFD6338B),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 10),
            
            // Botão "registrar"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação do botão registrar
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD6338B),
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'registrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}