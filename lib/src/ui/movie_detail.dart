import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/models/trailer_item.dart';
import 'package:movies_app_flutter/src/resources/movie_api_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetail extends StatefulWidget {
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  MovieDetail({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId
  });

  @override
  _MovieDetailState createState() => _MovieDetailState(
    title: title,
    posterUrl: posterUrl,
    description: description,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
    movieId: movieId
  );
}

class _MovieDetailState extends State<MovieDetail> {
  MovieApiProvider api;

  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  _MovieDetailState({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId
  });

  @override
  Widget build(BuildContext context) {
    api = new MovieApiProvider();

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext contect, bool innerBoxIsScrollable) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  elevation: 0.0,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network('https://image.tmdb.org/t/p/w500${posterUrl}',
                    fit: BoxFit.cover
                    )
                  ),
                )
              ];
            }
            , body: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                  Container(margin: EdgeInsets.only(top: 10.0)),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow),
                      Text(voteAverage, style: TextStyle(fontSize: 18.0, color: Colors.yellow)),
                      Container(margin: EdgeInsets.only(left: 10.0)),
                      Text(releaseDate, style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic)),
                    ],
                  ),
                  Container(margin: EdgeInsets.only(top: 10.0)),
                  Text(description),
                  Container(margin: EdgeInsets.only(top: 10.0)),
                  Text("Trailers", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                  FutureBuilder<TrailerItem>(
                    future: api.getVideos(movieId),
                    builder: (context, trailerSnapshot) {
                      if(trailerSnapshot.hasData){
                        if(trailerSnapshot.data.results.length > 0){
                          return trailerLayout(trailerSnapshot.data);
                        }else{
                          return noTrailer(trailerSnapshot.data);
                        }
                      }else{
                        return Center(child:
                          CircularProgressIndicator()
                        );
                      }
                    }
                  )
                ],
              ),
          ),
        )
      )
    );
  }

  Widget trailerLayout(TrailerItem data) {
    if(data.results.length > 1){
      return Row(
        children: <Widget>[
          trailerItemLayout(data, 0),
          trailerItemLayout(data, 1)
        ],
      );
    }else{
      return Row(
        children: <Widget>[
          trailerItemLayout(data,0)
        ],
      );
    }
  }

  Widget noTrailer(TrailerItem data) {
    return Center(
      child: Text("No trailers avaliable")
    );
  }

  trailerItemLayout(TrailerItem data, int i) {
    return Expanded(
    child:
    Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5.0),
          height: 100.0,
          color: Colors.grey,
          child: Center(
            child: IconButton(icon: Icon(Icons.play_circle_filled),
                onPressed: (){
                  _watchVideo(data.results[i].key, data.results[i].site);
                }),
          ),
        ),
        Text(data.results[i].name, maxLines: 1, overflow: TextOverflow.fade)
      ],
    )
    );
  }

  void _watchVideo(String key, String site) async {
    String videoBaseUrl = "";
    if(site == "YouTube"){
      videoBaseUrl = "https://www.youtube.com/watch?v=";
    }else{
      videoBaseUrl = "https://vimeo.com/";
    }

    String url = videoBaseUrl + key;
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw Exception("Cannot open video URL");
    }
  }
}