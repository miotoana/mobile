import 'package:flutter/material.dart';

class EmprestimoFormView extends StatefulWidget {
  const EmprestimoFormView({super.key});

  @override
  State<EmprestimoFormView> createState() => _EmprestimoFormViewState();
}
//estado 
class _EmprestimoFormViewState extends State<EmprestimoFormView> {
  final _formKey = GlobalKey<FormState>();
  final _usuarioIdController = TextEditingController(); 
  final _livroIdController = TextEditingController();

  final DateTime _dataEmprestimo = DateTime.now();
  DateTime? _dataDevolucao;

// Inicializa os controladores se necessário
  @override
  void dispose() {
    _usuarioIdController.dispose();
    _livroIdController.dispose();
    super.dispose();
  }

// função para salvar frmulario
  void _salvar() {
    if (_formKey.currentState!.validate()) {
      // Aqui você pode criar o objeto EmprestimoModel e retornar para a tela anterior
      Navigator.pop(context, {
        "usuarioId": _usuarioIdController.text,
        "livroId": _livroIdController.text,
        "dataEmprestimo": _dataEmprestimo,
        "dataDevolucao": _dataDevolucao,
      });
    }
  }

//selecioar data de devolução

  Future<void> _selecionarDataDevolucao(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dataDevolucao ?? DateTime.now(),
      firstDate: _dataEmprestimo,
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _dataDevolucao) {
      setState(() {
        _dataDevolucao = picked;
      });
    }
  }

//build da tela

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Empréstimo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usuarioIdController,
                decoration: InputDecoration(labelText: 'ID do Usuário'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o ID do usuário' : null,
              ),
              TextFormField(
                controller: _livroIdController,
                decoration: InputDecoration(labelText: 'ID do Livro'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o ID do livro' : null,
              ),
              ListTile(
                title: Text('Data do Empréstimo: ${_dataEmprestimo.day}/${_dataEmprestimo.month}/${_dataEmprestimo.year}'),
                trailing: Icon(Icons.calendar_today),
              ),
              ListTile(
                title: Text(_dataDevolucao == null
                    ? 'Selecionar Data de Devolução'
                    : 'Data de Devolução: ${_dataDevolucao!.day}/${_dataDevolucao!.month}/${_dataDevolucao!.year}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selecionarDataDevolucao(context),
              ),
              const SizedBox(height: 24),
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