import 'package:intl/intl.dart';

class Consulta {
  // atributos -> id, pet id, datahora, tipo de serviço, observação

  final int? id;
  final int petid; // chave estrangeira para o pet
  final DateTime datahora;
  final String tiposervico;
  final String observacao;

  // construtor em formato rapido

  Consulta({
    this.id,
    required this.petid,
    required this.datahora,
    required this.tiposervico,
    required this.observacao,
  });

  // metodos de conversão
  //tomap obj -> bd

  Map<String,dynamic> tomap() =>{
    "id": id,
    "pet_id": petid,
    "data_hora" :datahora.toIso8601String(),
    "tipo_servico" :tiposervico,
    "observacao" :observacao
  };

//fromMap() : BD -> obj

  factory Consulta.fromMap(Map<String,dynamic> map){
    return Consulta(
      id: map["id"] as int,
      petid: map["pet_id"] as int, 
      datahora: DateTime.parse(map["data_hora"] as String), 
      tiposervico: map["tipo_servico"] as String, 
      observacao: map["observacao"] as String);
  }

  //método para converter dataHora em Formato Local("dd/MM/yyyy HH:mm");

  String get dataHoraLocal{
    final local = DateFormat("dd/MM/yyyy HH:mm");
    return local.format(datahora);
  }

   @override
  String toString() {
    // TODO: implement toString
    return "Consulta:{id $id, petId: $petid, dataHora: $datahora, serviço: $tiposervico, observacao: $observacao}";
  }
}