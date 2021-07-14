import 'package:flutter/material.dart';
import 'package:levelup4_pokedex/src/modules/home/home_repository.dart';

class HomeController {
  HomeRepository repository = HomeRepository();
  List pokedex = [];

  Future<void> getPokedex() async {
    List pokemonList = await repository.getPokedex();
    pokedex = pokemonList;
  }

  // String getImageURL(index) {
  //   var pokemonID = pokedex[index]['id'];
  //   return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonID}.png";
  // }

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
}
