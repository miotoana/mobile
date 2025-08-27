// classe Controller para Usuários

import 'package:biblioteca_app/models/usuario_model.dart';
import 'package:biblioteca_app/services/api_service.dart';
import 'package:biblioteca_app/views/livro/livro_%20list_view.dart' show livroModel;

class livroController {
  get livroModel => null;


  //métodos
  //Get Usuários
  Future<List<UsuarioModel>> fetchAll() async{
    final list = await ApiService.getList("livro?_sort=nome");
    //retornar a lista de usuários
    return list.map<UsuarioModel>((e)=>UsuarioModel.fromJson(e)).toList();
  }
  //Get Usuário
  Future<livroModel> fetchOne(String id) async{
    final user = await ApiService.getOne("usuarios", id);
    return UsuarioModel.fromJson(user);
  }

  //Post Usuário
  Future<UsuarioModel> create(UsuarioModel u) async{
    final created = await ApiService.post("usuarios", u.tojson());
    return UsuarioModel.fromJson(created);
  }

  //Put Usuário
  Future<UsuarioModel> update(UsuarioModel u) async{
    final updated = await ApiService.put("livros", u.tojson(), u.id!);
    return livroModel.fromJson(updated);
  }

  //Delete Usuário
  Future<void> delete(String id) async{
    await ApiService.delete("usuarios", id); //não tem retorno
  }


}

class livroModel {
}