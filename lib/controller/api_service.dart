import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_morty_app/model/character.model.dart';
import 'package:rick_morty_app/model/location.model.dart';

const String baseUrl = 'https://rickandmortyapi.com/api/';

Future<List<Character>> getCharacters() async {
  final response = await http.get(Uri.parse('$baseUrl/character'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> decodedData = jsonDecode(response.body);
    final List<dynamic> results = decodedData['results'];
    return results.map((json) => Character.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load characters');
  }
}

Future<List<Locations>> getLocations() async {
  final response = await http.get(Uri.parse('$baseUrl/location'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> decodedData = jsonDecode(response.body);
    final List<dynamic> results = decodedData['results'];
    return results.map((json) => Locations.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load location');
  }
}
