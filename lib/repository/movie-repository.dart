import 'package:flutter_playground/model/Movie.dart';

class MovieRepository {
  static MovieRepository _repository = MovieRepository._();

  MovieRepository._();

  factory MovieRepository() {
    return _repository;
  }

  Future<List<Movie>> fetchMovies() async {
    return await Future.delayed(Duration(seconds: 3), () {
      return [
        Movie(title: "Avengers", summary: "", image: ""),
        Movie(title: "Avengers 2", summary: "", image: ""),
        Movie(title: "Avengers 3", summary: "", image: ""),
      ];
    });
  }

}
