import 'package:flutter/material.dart';
import 'package:rick_morty_app/component/slider.custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Rick and Morty App")),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SliderCustom(categoria: 'Personagens'),
                  SliderCustom(categoria: 'Localizações'),
                  SliderCustom(categoria: 'Episódios'),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Personagens",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              label: "Localizações",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: "Episódios",
            ),
          ],
        ));
  }
}
