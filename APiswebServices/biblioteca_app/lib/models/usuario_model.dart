//classe de modelagem do usuário 

class UsuarioModel {

  //atributos

  final String? id; //pode ser nulo 
  final String nome;
  final String email;

  //construtor

  UsuarioModel({
    this.id, required this.nome, required this.email
  });

  //fromJson map =>obj

  factory UsuarioModel.fromJson(Map<String,dynamic> json) => UsuarioModel(
    id: json["id"].toString(),
    nome: json["nome"].toString(),
    email: json["email"].toString()
  );

  //tojson obj =>map

  Map<String,dynamic> tojson() => {
    "id":id,
    "nome": nome,
    "email": email
  };

}