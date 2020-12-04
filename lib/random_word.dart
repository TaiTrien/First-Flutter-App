import 'package:bt1/favorite_screen.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final List<WordPair> _suggestions = <WordPair>[]; // NEW
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  final _favorite = List<WordPair>(); // NEW

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) return Divider();

          final int index = i ~/ 2;
          if (index >= _suggestions.length) _suggestions.addAll(generateWordPairs().take(10));

          WordPair currentPair = _suggestions[index];
          bool isFavorite = _favorite.contains(currentPair);

          return ListTile(
            onTap: () {
              setState(() {
                if (!isFavorite)
                  _favorite.add(currentPair);
                else
                  _favorite.remove(currentPair);
              });
            },
            title: Text(
              currentPair.asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FavoriteScreen(
                              favorites: _favorite,
                            )));
              }),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
