import 'package:anime_app/models/anime_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AnimeProvider with ChangeNotifier {
  List<Datum> trandingAnime = [];

  List<Datum> searchAnime = [];

  AnimeProvider() {
    getTrandingAnime();
  }
  getTrandingAnime() async {
    final res =
        await http.get(Uri.parse('https://kitsu.io/api/edge/trending/anime'));
    final response = trendingResponseFromJson(res.body);
    trandingAnime.addAll(response.data);
    return trandingAnime;
  }

  Future<List<Datum>> getSearch(String query) async {
    final res = await http.get(
        Uri.parse('https://kitsu.io/api/edge/anime?filter[text]=' + query));
    final response = trendingResponseFromJson(res.body);
    searchAnime = [];
    searchAnime.addAll(response.data);
    return searchAnime;
  }
}
