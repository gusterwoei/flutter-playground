import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/bloc/movie-bloc.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  MovieBloc _bloc;

  @override
  void initState() {
    _bloc = MovieBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        bloc: _bloc,
        builder: (BuildContext context, MovieState state) {
          // progress indicator
          if (state is LoadingMovieState) {
            return CircularProgressIndicator();
          }

          // movie data list
          if (state is MovieDataState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (_, index) {
                final item = state.data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.title),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
