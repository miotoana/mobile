// Classe 
class EmprestimoModel {
  //atributos
  final String? id;
  final String usuarioId;
  final String livroId;
  final String dataEmprestimo;
  final String dataDevolucao;
  final bool devolvido;

  //cosntrutor
  EmprestimoModel({
    this.id,
    required this.usuarioId,
    required this.livroId,
    required this.dataEmprestimo,
    required this.dataDevolucao,
    required this.devolvido
  });

  //fromJson Map => OBJ
  factory EmprestimoModel.fromJson(Map<String,dynamic> json) =>
  EmprestimoModel(
    id: json["id"].toString(),
    usuarioId: json["usuarioId"].toString(),
    livroId: json["livroId"].toString(),
    dataEmprestimo: json["dataEmprestimo"].toString(),
    dataDevolucao: json["dataDevolucao"].toString(),
    devolvido: json["devolvido"] == true ? true : false
  );

  //toJson OBJ => MAP
  Map<String,dynamic> toJson() => {
    "id":id,
    "usuarioId":usuarioId,
    "livroId":livroId,
    "dataEmprestimo":dataEmprestimo,
    "dataDevolucao":dataDevolucao,
    "devolvido":devolvido
  };

}