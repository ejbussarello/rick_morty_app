import 'package:flutter/material.dart';
import 'package:rick_morty_app/component/slider.personagem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.shade200,
        title: const Text('Rick and Morty API with HTTP'),
        elevation: 5,
        centerTitle: true,
      ),
      body: const SliderPersonagem(categoria: 'Personagens'),
    );
  }
}
