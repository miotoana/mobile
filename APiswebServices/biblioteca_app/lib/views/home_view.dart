import 'package:biblioteca_app/views/livro/livro_%20list_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //atributos
  int _index = 0;
  final List<Widget> _paginas = [
    const LivroListView(),
    const EmprestimoListView(),
    const UsuariolistView()
  ];

  //build da Tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gerenciador de Biblioteca"),),
      body: _paginas[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) => setState(() {
          _index = value;
        }),
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.menu_book),label: "Livros"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment),label: "Emprétimo"),
          BottomNavigationBarItem(icon: Icon(Icons.people),label: "Usuários"),
          
        ]),
    );
  }
}

class EmprestimoListView extends StatelessWidget {
  const EmprestimoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Empréstimo List View'),
    );
  }
}

class UsuariolistView extends StatelessWidget {
  const UsuariolistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Usuário List View'),
    );
  }
}