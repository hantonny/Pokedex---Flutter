// ignore_for_file: depend_on_referenced_packages, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:pokedex/components/option_button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pokedex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<OptionButton> pokemonButtons = [];

  Future<void> loadProducts() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=0&limit=151'));

    Map<String, dynamic> pokemons = jsonDecode(response.body);

    List<dynamic> pokemonList = pokemons['results'];

    pokemonList.forEach((pokemonData) async {
      String pokemonName = pokemonData['name'];

      final detailResponse = await http.get(Uri.parse(pokemonData['url']));
      Map<String, dynamic> detailData = jsonDecode(detailResponse.body);

      List<dynamic> types = detailData['types'];

      pokemonButtons.add(OptionButton(
        name: pokemonName,
        image: detailData['sprites']['other']['home']['front_default'],
        id: detailData['id'].toString(),
        type: types,
      ));

      pokemonButtons.sort((a, b) => int.parse(a.id) - int.parse(b.id));

      setState(() {});
    });
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: pokemonButtons,
        )),
      ),
    );
  }
}
