import 'package:flutter/material.dart';
import 'package:rick_morty_app/controller/api_service.dart';
import 'package:rick_morty_app/model/character.model.dart';

class SliderPersonagem extends StatefulWidget {
  final String categoria;

  const SliderPersonagem({super.key, required this.categoria});

  @override
  State<SliderPersonagem> createState() => _SliderPersonagemState();
}

class _SliderPersonagemState extends State<SliderPersonagem> {
  late Future<List<Character>> futurePersonagens;

  @override
  void initState() {
    super.initState();
    futurePersonagens = getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.categoria,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      letterSpacing: 10,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Icon(
                  Icons.navigate_next,
                  size: 40,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            height: 250,
            child: FutureBuilder<List<Character>>(
              future: futurePersonagens,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text("Falha ao carregar personagens"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('Nenhum personagem encontrado!'));
                }

                final characters = snapshot.data!;
                return ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(2),
                  scrollDirection: Axis.horizontal,
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    final character = characters[index];
                    return GestureDetector(
                      onTap: () {
                        print(character.name);
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: SizedBox(
                              width: 250,
                              height: 250,
                              child: Image.network(
                                character.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              width: 200,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                character.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
