import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:levelup4_pokedex/src/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getPokedex().then((value) {
      setState(() {});
    });
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
                    itemCount: controller.pokedex.length,
                    itemBuilder: (context, index) {
                      var pokemonImages = controller.pokedex[index]['id'];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: controller.getColor(index),
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
                                //   imageUrl: controller.pokedex[index]['img'],
                                //   height: 100,
                                // ),
                              ),
                              Positioned(
                                top: 30,
                                left: 20,
                                child: Text(
                                  controller.pokedex[index]['name'],
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
