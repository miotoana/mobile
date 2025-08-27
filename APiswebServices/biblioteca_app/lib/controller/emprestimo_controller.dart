// controller para emprestimos

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/emprestimo_model.dart';

class EmprestimoController {
  final String baseUrl = 'SUA_URL_DA_API/emprestimos'; // ajuste para sua API
//metodos para registar um novo emprestimo
  Future<bool> registrarEmprestimo(EmprestimoModel emprestimo) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(emprestimo.toJson()),
    );
    return response.statusCode == 201; // ajuste conforme sua API
  }

  // Exemplo de método para buscar todos os empréstimos
  Future<List<EmprestimoModel>> listarEmprestimos() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => EmprestimoModel.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar empréstimos');
    }
  }
}