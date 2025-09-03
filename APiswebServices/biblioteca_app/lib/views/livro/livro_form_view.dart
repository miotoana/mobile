import 'package:biblioteca_app/models/livro_model.dart';
import 'package:flutter/material.dart';

class LivroFormView extends StatefulWidget {
  final LivroModel? livro;
  const LivroFormView({super.key, this.livro});

  @override
  State<LivroFormView> createState() => _LivroFormViewState();
}
//estado 
class _LivroFormViewState extends State<LivroFormView> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _autorController = TextEditingController();
  bool _disponivel = true;

  @override
  void initState() {
    super.initState();
    if (widget.livro != null) {
      _tituloController.text = widget.livro!.titulo;
      _autorController.text = widget.livro!.autor;
      _disponivel = widget.livro!.disponivel;
    }
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _autorController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final livro = LivroModel(
        id: widget.livro?.id,
        titulo: _tituloController.text,
        autor: _autorController.text,
        disponivel: _disponivel,
      );
      Navigator.pop(context, livro);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.livro == null ? 'Novo Livro' : 'Editar Livro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o título' : null,
              ),
              TextFormField(
                controller: _autorController,
                decoration: InputDecoration(labelText: 'Autor'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o autor' : null,
              ),
              SwitchListTile(
                title: Text('Disponível'),
                value: _disponivel,
                onChanged: (value) {
                  setState(() {
                    _disponivel = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvar,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
