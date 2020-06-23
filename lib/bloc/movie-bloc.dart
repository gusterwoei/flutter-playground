import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/model/Movie.dart';
import 'package:flutter_playground/repository/movie-repository.dart';

class MovieBloc extends Bloc<dynamic, MovieState> {
  MovieRepository _repository = MovieRepository();

  @override
  MovieState get initialState {
    _repository.fetchMovies().then((value) {
      return MovieDataState(value);
    });
    return LoadingMovieState();
  }

  @override
  Stream<MovieState> mapEventToState(event) async* {
    final movies = await _repository.fetchMovies();
    yield MovieDataState(movies);
  }
}

class MovieState {}

class LoadingMovieState extends MovieState {}

class MovieDataState extends MovieState {
  List<Movie> data = [];

  MovieDataState(this.data);

}
