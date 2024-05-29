import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_morty_app/model/character.model.dart';
import 'package:rick_morty_app/model/episode.model.dart';

Future<Character> getCharacters() async {
  const url = 'https://rickandmortyapi.com/api/character';

  final response = await http.get(Uri.parse(url));

  try {
    return Character.fromJson(jsonDecode(response.body));
  } catch (e) {
    throw Exception('Erro ao obter os personagens!');
  }
}

Future<Location> getLocations() async {
  const url = 'https://rickandmortyapi.com/api/location';

  final response = await http.get(Uri.parse(url));

  try {
    return Location.fromJson(jsonDecode(response.body));
  } catch (e) {
    throw Exception('Erro ao obter localizações!');
  }
}

Future<Episode> getEpisodes() async {
  const url = 'https://rickandmortyapi.com/api/episode';

  final response = await http.get(Uri.parse(url));

  try {
    return Episode.fromJson(jsonDecode(response.body));
  } catch (e) {
    throw Exception('Erro ao obter os episódios!');
  }
}
