//controller de gerenciar os livros
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/livro_model.dart';

class LivroController {
  final String baseUrl = 'SUA_URL_DA_API/livros'; // ajuste para API
//registro dos livros
  Future<bool> registrarLivro(LivroModel livro) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(livro.toJson()),
    );
    return response.statusCode == 201; // ajuste conforme sua API
  }
//listar livro
  Future<List<LivroModel>> listarLivros() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
  //verificar resposta
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => LivroModel.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar livros');
    }
  }
}