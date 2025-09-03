import 'package:flutter/material.dart';

class LivroListView extends StatefulWidget {
  const LivroListView({super.key});

  @override
  State<LivroListView> createState() => _LivroListViewState();
}

class _LivroListViewState extends State<LivroListView> {
  // Exemplo de lista de livros
  final List<Map<String, String>> livros = [
    {"titulo": "Dom Casmurro", "autor": "Machado de Assis"},
    {"titulo": "O Cortiço", "autor": "Aluísio Azevedo"},
    {"titulo": "Memórias Póstumas", "autor": "Machado de Assis"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Livros")),
      body: ListView.builder(
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final livro = livros[index];
          return ListTile(
            leading: Icon(Icons.menu_book),
            title: Text(livro["titulo"] ?? ""),
            subtitle: Text(livro["autor"] ?? ""),
          );
        },
      ),
    );
  }
}