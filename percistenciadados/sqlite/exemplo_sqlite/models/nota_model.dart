// criar a classe model para as notas

class nota{

  // atributos

  final int? id; // permite criar objeto com o id nulo
  final String titulo;
  final String conteudo;

  //costrutor

nota({this.id,required this.titulo,required this.conteudo});

  // metados
  //converter dados para banco de dados
  //metado map => converte um objetos da classe nota para map(para insirir num banco de dados)
Map<String,dynamic>toMap(){
  return {
    "id" : id,
    "titulo" : titulo
    "conteudo": conteudo
  }
}

//factory (vem do banco de dados)

}