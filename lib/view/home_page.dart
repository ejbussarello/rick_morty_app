import 'package:flutter/material.dart';
import 'package:rick_morty_app/controller/api_service.dart';
import 'package:rick_morty_app/model/character.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty Characters'),
      ),
      body: FutureBuilder<List<Character>>(
        future: getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Failed to load characters: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No characters found'));
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
      ),
    );
    //bottomNavigationBar:
    //BottomNavigationBar(
    //  items: const [
    //    BottomNavigationBarItem(
    //      icon: Icon(Icons.person),
    //      label: "Personagens",
    //    ),
    //    BottomNavigationBarItem(
    //      icon: Icon(Icons.location_city),
    //      label: "Localizações",
    //    ),
    //    BottomNavigationBarItem(
    //      icon: Icon(Icons.movie),
    //      label: "Episódios",
    //    ),
    //  ],
    //);
  }
}
