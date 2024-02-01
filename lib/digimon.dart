// ignore_for_file: depend_on_referenced_packages, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:pokedex/components/app_drawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/components/option_button.dart';

class Digimon extends StatefulWidget {
  const Digimon({super.key});

  @override
  State<Digimon> createState() => _DigimonState();
}

class _DigimonState extends State<Digimon> {
  List<OptionButton> digimonButtons = [];
  Future<void> loadProducts() async {
    final response =
        await http.get(Uri.parse('https://digimon-api.vercel.app/api/digimon'));

    // Map<String, dynamic> digimons = jsonDecode(response.body);

    List<dynamic> digimonList = jsonDecode(response.body);

    late int id = 1;
    digimonList.forEach((digimonData) async {
      String digimonName = digimonData['name'];

      digimonButtons.add(OptionButton(
        name: digimonName,
        image: digimonData['img'],
        id: (id++).toString(),
        level: digimonData['level'],
      ));

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
        backgroundColor: Colors.deepOrangeAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Digipedia',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        
        child: Container(
          color: Colors.white,
          child: Center(
              
              child: Column(
            children: digimonButtons,
          )),
        ),
      ),
    );
  }
}
