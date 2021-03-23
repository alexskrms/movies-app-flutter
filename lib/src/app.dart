import 'package:flutter/material.dart';
import 'package:movies_app_flutter/src/ui/movie_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Movies"),),
        body: MovieList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.movie),
        ),
      ),
    );
  }

}
