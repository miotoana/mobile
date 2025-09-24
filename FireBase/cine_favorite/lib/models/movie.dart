//classe de modelagem de dados para Movie

class Movie {
  //atributos
  final int id; //Id fo tmdb
  final String title; //titulo do filme
  final String posterPath; //Caminho para a imagem do Poster
  double rating;

  //Construtor
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
   this.rating = 0,
  });

  //método para converter Json pra objeto

  //tomap

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "posterPath": posterPath,
      "rating": rating,
    };
  }

  //frommap
factory Movie.fromMap(Map<String,dynamic> map){
    return Movie(
      id: map["id"], 
      title: map["title"], 
      posterPath: map["posterPath"],
      rating: (map["rating"] as num).toDouble());
  }

}