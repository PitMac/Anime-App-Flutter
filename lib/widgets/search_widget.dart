import 'package:anime_app/models/anime_model.dart';
import 'package:anime_app/providers/anime_provider.dart';
import 'package:anime_app/providers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  final animeProvider = AnimeProvider();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final themeProvider = Provider.of<ChangeTheme>(context);
    if (query.isEmpty) {
      return Container();
    }
    return searchListResult(themeProvider);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final themeProvider = Provider.of<ChangeTheme>(context);
    if (query.isEmpty) {
      return Container();
    }
    return searchListResult(themeProvider);
  }

  FutureBuilder<List<Datum>> searchListResult(ChangeTheme themeProvider) {
    return FutureBuilder(
      future: animeProvider.getSearch(query),
      builder: (context, AsyncSnapshot<List<Datum>> snapshot) {
        if (snapshot.hasData) {
          final animes = snapshot.data;

          return ListView(
            children: animes!.map((anime) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: anime);
                  },
                  child: ListTile(
                    leading: Hero(
                      tag: anime.id,
                      child: Image.network(anime.attributes.posterImage!.large),
                    ),
                    title: Text(anime.attributes.titles.enJp.toString(),
                        style: TextStyle(
                          color: themeProvider.isDarkTheme
                              ? Colors.white
                              : Colors.black,
                        )),
                  ),
                ),
              );
            }).toList(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.purpleAccent,
            ),
          );
        }
      },
    );
  }
}
