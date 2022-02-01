import 'package:anime_app/models/anime_model.dart';
import 'package:anime_app/providers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeDetailScreen extends StatelessWidget {
  const AnimeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = ModalRoute.of(context)!.settings.arguments as Datum;
    final themeProvider = Provider.of<ChangeTheme>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(
                color: themeProvider.isDarkTheme
                    ? Colors.purpleAccent
                    : Colors.white),
            backgroundColor: const AppBarTheme().backgroundColor,
            pinned: true,
            centerTitle: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                anime.attributes.titles.enJp.toString(),
                style: TextStyle(
                  color: themeProvider.isDarkTheme
                      ? Colors.purpleAccent
                      : Colors.white,
                ),
              ),
              background: Hero(
                tag: anime.id,
                child: Image.network(
                  anime.attributes.posterImage!.large,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purpleAccent, width: 3),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.only(
                  right: 10, left: 10, top: 20, bottom: 10),
              child: Center(
                child: Text(
                  "Created at: " +
                      anime.attributes.createdAt.toLocal().toString(),
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: Text(
                  anime.attributes.synopsis,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purpleAccent, width: 3),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: Text(
                  "Episode Count: " + anime.attributes.episodeCount.toString(),
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.network(anime.attributes.coverImage!.large),
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.network(anime.attributes.posterImage!.large),
          )),
        ],
      ),
    );
  }
}
