import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  final List<WordPair> favorites;

  const FavoriteScreen({Key key, this.favorites}) : super(key: key);
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Favorite item'),
        ),
        body: ListView.builder(
            itemCount: widget.favorites.length,
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                title: Text(
                  widget.favorites[i].asPascalCase,
                ),
              );
            }));
  }
}
