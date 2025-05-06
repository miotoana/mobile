import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  String _corSelecionada = 'Azul';
  String _nomeSalvo = '';
  String _idadeSalva = '';
  String _corSalva = 'Azul';

  final Map<String, Color> _cores = {
    'Azul': Colors.blue,
    'Verde': Colors.green,
    'Vermelho': Colors.red,
    'Amarelo': Colors.yellow,
    'Roxo': Colors.purple,
  };

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nomeSalvo = prefs.getString('nome') ?? '';
      _idadeSalva = prefs.getString('idade') ?? '';
      _corSalva = prefs.getString('cor') ?? 'Azul';

      _nomeController.text = _nomeSalvo;
      _idadeController.text = _idadeSalva;
      _corSelecionada = _corSalva;
    });
  }

  Future<void> _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', _nomeController.text);
    await prefs.setString('idade', _idadeController.text);
    await prefs.setString('cor', _corSelecionada);
    _carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _cores[_corSalva] ?? Colors.white,
        appBar: AppBar(title: Text('Dados Pessoais')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _idadeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Idade'),
              ),
              DropdownButtonFormField<String>(
                value: _corSelecionada,
                items: _cores.keys
                    .map((cor) =>
                        DropdownMenuItem(value: cor, child: Text(cor)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _corSelecionada = value;
                    });
                  }
                },
                decoration: InputDecoration(labelText: 'Cor favorita'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _salvarDados,
                child: Text('Salvar Dados'),
              ),
              SizedBox(height: 24),
              Text(
                'Dados Salvos:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Nome: $_nomeSalvo'),
              Text('Idade: $_idadeSalva'),
              Text('Cor favorita: $_corSalva'),
            ],
          ),
        ),
      ),
    );
  }
}
