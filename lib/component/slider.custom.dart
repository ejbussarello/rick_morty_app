import 'package:flutter/material.dart';
import 'package:rick_morty_app/controller/api_service.dart';
import 'package:rick_morty_app/model/character.model.dart';
import 'package:rick_morty_app/model/episode.model.dart';
import 'package:rick_morty_app/model/location.model.dart';

class SliderCustom extends StatefulWidget {
  final String categoria;

  const SliderCustom({super.key, required this.categoria});

  @override
  State<SliderCustom> createState() => _SliderCustomState();
}

class _SliderCustomState extends State<SliderCustom> {
  late Future<List<Character>> futurePersonagens;
  late Future<List<Locations>> futureLocalizacoes;
  late Future<List<Episode>> futureEpisodios;

  @override
  void initState() {
    super.initState();
    futurePersonagens = getCharacters();
    //futureLocalizacoes = getLocations();
    // futureEpisodios = getEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurePersonagens,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Falha ao carregar personagens"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum personagem encontrado!'));
        }

        final characters = snapshot.data!;
        return ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character = characters[index];
            return ListTile(
              leading: Image.network(character.image),
              title: Text(character.name),
              subtitle: Text('${character.species} - ${character.status}'),
            );
          },
        );
      },
    );
  }
}
