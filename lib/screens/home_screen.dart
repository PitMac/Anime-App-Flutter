import 'package:anime_app/providers/anime_provider.dart';
import 'package:anime_app/providers/dark_theme_provider.dart';
import 'package:anime_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ChangeTheme>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeProvider.changeTheme();
        },
        child: Icon(
          themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
          color: themeProvider.isDarkTheme ? Colors.purpleAccent : Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text('Animes'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: Icon(
                Icons.search,
                color: themeProvider.isDarkTheme
                    ? Colors.purpleAccent
                    : Colors.white,
                size: 27,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Text(
                'Tranding Anime',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: Colors.purpleAccent),
              )),
          const _TradingList(),
        ],
      ),
    );
  }
}

class _TradingList extends StatelessWidget {
  const _TradingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeProvider = Provider.of<AnimeProvider>(context);
    return FutureBuilder(
        future: animeProvider.getTrandingAnime(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                  itemCount: animeProvider.trandingAnime.length,
                  itemBuilder: (_, i) {
                    final anime = animeProvider.trandingAnime[i];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, bottom: 20, left: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: anime,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Hero(
                                tag: anime.id,
                                child: Image.network(
                                  anime.attributes.posterImage!.large,
                                  height: 230,
                                  width: 360,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.purpleAccent,
            ));
          }
        });
  }
}
