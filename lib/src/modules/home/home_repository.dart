import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeRepository {
  Future<List> getPokedex() async {
    var url = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List pokedex = json['pokemon'];
      return pokedex;
    } else {
      return [];
    }
  }
}
