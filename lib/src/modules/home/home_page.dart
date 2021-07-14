import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokedex = [];

  @override
  void initState() {
    super.initState();
    getPokemon().then((value) {
      setState(() {});
    });
  }

  Future<void> getPokemon() async {
    var url = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      pokedex = json['pokemon'];
    }
  }

  Color getColor(int index) {
    final type = pokedex[index]["type"][0];
    switch (type) {
      case "Normal":
        return Color(0xffA8A77A);
      case "Fire":
        return Color(0xffEE8130);
      case "Water":
        return Color(0xff6390F0);
      case "Electric":
        return Color(0xffFFCF4A);
      case "Grass":
        return Color(0xff7AC74C);
      case "Ice":
        return Color(0xff96D9D6);
      case "Fighting":
        return Color(0xffC22E28);
      case "Poison":
        return Color(0xffA33EA1);
      case "Ground":
        return Color(0xffE2BF65);
      case "Flying":
        return Color(0xffA98FF3);
      case "Psychic":
        return Color(0xffF95587);
      case "Bug":
        return Color(0xffA6B91A);
      case "Rock":
        return Color(0xffB6A136);
      case "Ghost":
        return Color(0xff735797);
      case "Dragon":
        return Color(0xff6F35FC);
      case "Dark":
        return Color(0xff705746);
      case "Steel":
        return Color(0xffB7B7CE);
      case "Fairy":
        return Color(0xffD685AD);

      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              "assets/images/pokeball.png",
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              "Pokedex",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 32.0,
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                    ),
                    itemCount: pokedex.length,
                    itemBuilder: (context, index) {
                      var pokemonImages = pokedex[index]['id'];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: getColor(index),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: -10,
                                right: -20,
                                child: Image.asset(
                                  "assets/images/pokeball.png",
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonImages}.png",
                                  height: 100,
                                ),
                                // child: CachedNetworkImage(
                                //   imageUrl: pokedex[index]['img'],
                                //   height: 100,
                                // ),
                              ),
                              Positioned(
                                top: 30,
                                left: 20,
                                child: Text(
                                  pokedex[index]['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
