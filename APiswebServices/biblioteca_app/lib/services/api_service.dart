//classe que vai auxiliar as conexões com o DB
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // criar métodos de classe e não métodos de OBJ
  // permite uma maior segurança na solicitação de requisições http
  // static -> métodos e atributos de classe

  static const String _baseUrl = "http://10.109.197.10:3000";

  //métodos da Classe

  //GET -> Pegar a Lista de Recursos
  static Future<List<dynamic>> getList(String path) async{
    final res = await http.get(Uri.parse("$_baseUrl/$path"));
    //verificar a resposta
    if(res.statusCode == 200) return json.decode(res.body);
    //se não deu certo
    throw Exception("Falha ao carregar lista de $path");
  }

  //GET -> Pegar um único Recurso
  static Future<Map<String,dynamic>> getOne(String path, String id) async{
    final res = await http.get(Uri.parse("$_baseUrl/$path/$id"));
    if(res.statusCode == 200) return json.decode(res.body);
    throw Exception("Falha ao Carregar Recurso de $path");
  }

  //Post -> Adicionar Recursos no BD
  static Future<Map<String,dynamic>> post(String path, Map<String,dynamic> body) async{
    final res = await http.post(
      Uri.parse("$_baseUrl/$path"),
      headers: {"Content-Type": "aplication/json"},
      body: json.encode(body));
    if(res.statusCode == 201) return json.decode(res.body);
    throw Exception("Falha ao Adicionar Recurso em $path");
  }

  //PUT -> alteara Recurso do BD
  static Future<Map<String,dynamic>> put(String path, Map<String,dynamic> body, String id) async{
    final res = await http.put(
      Uri.parse("$_baseUrl/$path/$id"),
      headers: {"Content-Type": "aplication/json"},
      body: json.encode(body));
    if(res.statusCode == 200) return json.decode(res.body);
    throw Exception("Falha ao Alterar Recurso em $path");
  }

  //DELETE -> Remove o Recurso do BD
  static Future<void> delete(String path, String id) async{
    final res = await http.delete(Uri.parse("$_baseUrl/$path/$id"));
    if(res.statusCode != 200) throw Exception("Falha Ao Deletar Recurso $path");
  }
}