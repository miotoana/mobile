import 'dart:io';

import 'package:cine_favorite/controllers/movie_firestore_controller.dart';
import 'package:cine_favorite/models/movie.dart';
import 'package:cine_favorite/views/search_movie_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final _movieController = MovieFirestoreController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Filmes Favoritos"),
        actions: [
          IconButton(
            onPressed: FirebaseAuth.instance.signOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder<List<Movie>>(
        stream: _movieController.getFavoriteMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Erro ao Carregar a Lista de Favoritos"));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhum Filme Adicionado aos Favoritos"));
          }
          final favoriteMovies = snapshot.data!;
          return GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favoriteMovies[index];
              double rating = movie.rating ?? 0.0;
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.file(
                        File(movie.posterPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(child: Text(movie.title)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Text("Nota do Filme: ${rating.toStringAsFixed(1)}"),
                          Slider(
                            value: rating,
                            min: 0,
                            max: 10,
                            divisions: 20,
                            label: rating.toStringAsFixed(1),
                            onChanged: (newRating) {
                              setState(() {
                                favoriteMovies[index].rating = newRating;
                              });
                              _movieController.updateMovieRating(movie.id, newRating);
                            },
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _movieController.deleteFavoriteMovie(movie.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchMovieView()),
        ),
        child: Icon(Icons.search),
      ),
    );
  }
}