import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/models/movie_item.dart';
import 'package:movies_app_flutter/src/resources/movie_api_provider.dart';
import 'package:movies_app_flutter/src/ui/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieApiProvider api;

  @override
  void initState() {
    super.initState();
    api = new MovieApiProvider();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieItem>(
          future: api.getMovieList(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return buildMovieGrid(snapshot);
            }else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      );
  }

  Widget buildMovieGrid(AsyncSnapshot<MovieItem> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7
        ),
        itemBuilder: (BuildContext context, int index){
          return GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
                  fit: BoxFit.cover,
                ),
              onTap: () => openMovieDetail(snapshot.data, index),
              )
          );
        }
    );
  }

  openMovieDetail(MovieItem data, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MovieDetail(
          title: data.results[index].title,
          posterUrl: data.results[index].backdropPath,
          description: data.results[index].overview,
          releaseDate: data.results[index].releaseDate,
          voteAverage: data.results[index].voteAverage.toString(),
          movieId: data.results[index].id
      );
    })
    );
  }
}