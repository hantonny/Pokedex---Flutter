// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

enum PokemonType {
  normal,
  fire,
  water,
  electric,
  grass,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
}

class OptionButton extends StatefulWidget {
  final String name;
  final String image;
  final String id;
  final List<dynamic>? type;
  final String? level;

  const OptionButton({
    super.key,
    required this.name,
    required this.image,
    required this.id,
    this.type,
    this.level,
  });

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    List<Padding> types = [];

    Color ColorBorder = Colors.blue;

    Color getColorForTypeDigimon(String typeName) {
      switch (typeName) {
        case 'Fresh':
          return const Color(0xFFA8A77A);
        case 'In-Training':
          return const Color(0xFFF7D02C);
        case 'Rookie':
          return const Color(0xFFB6A136);
        case 'Champion':
          return const Color(0xFF6390F0);
        case 'Ultimate':
          return const Color(0xFF7AC74C);
        case 'Mega':
          return const Color(0xFFF95587);
        default:
          return Colors.blue; // Cor padrão
      }
    }

    Color getColorForTypePokemon(String typeName) {
      switch (typeName) {
        case 'normal':
          ColorBorder = const Color(0xFFA8A77A);
          return const Color(0xFFA8A77A);
        case 'fire':
          ColorBorder = const Color(0xFFEE8130);
          return const Color(0xFFEE8130);
        case 'water':
          ColorBorder = const Color(0xFF6390F0);
          return const Color(0xFF6390F0);
        case 'electric':
          ColorBorder = const Color(0xFFF7D02C);
          return const Color(0xFFF7D02C);
        case 'grass':
          ColorBorder = const Color(0xFF7AC74C);
          return const Color(0xFF7AC74C);
        case 'ice':
          ColorBorder = const Color(0xFF96D9D6);
          return const Color(0xFF96D9D6);
        case 'fighting':
          ColorBorder = const Color(0xFFC22E28);
          return const Color(0xFFC22E28);
        case 'poison':
          ColorBorder = const Color(0xFFA33EA1);
          return const Color(0xFFA33EA1);
        case 'ground':
          ColorBorder = const Color(0xFFE2BF65);
          return const Color(0xFFE2BF65);
        case 'flying':
          ColorBorder = const Color(0xFFA98FF3);
          return const Color(0xFFA98FF3);
        case 'psychic':
          ColorBorder = const Color(0xFFF95587);
          return const Color(0xFFF95587);
        case 'bug':
          ColorBorder = const Color(0xFFA6B91A);
          return const Color(0xFFA6B91A);
        case 'rock':
          ColorBorder = const Color(0xFFB6A136);
          return const Color(0xFFB6A136);
        case 'ghost':
          ColorBorder = const Color(0xFF735797);
          return const Color(0xFF735797);
        case 'dragon':
          ColorBorder = const Color(0xFF6F35FC);
          return const Color(0xFF6F35FC);
        case 'dark':
          ColorBorder = const Color(0xFF705746);
          return const Color(0xFF705746);
        case 'steel':
          ColorBorder = const Color(0xFFB7B7CE);
          return const Color(0xFFB7B7CE);
        case 'fairy':
          ColorBorder = const Color(0xFFD685AD);
          return const Color(0xFFD685AD);
        default:
          return Colors.blue; // Cor padrão
      }
    }

    widget.type?.map<String>((typeData) {
      String typeName = typeData['type']['name'];

      types.add(Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 65,
          height: 27,
          decoration: BoxDecoration(
              color: getColorForTypePokemon(typeName), // Cor de fundo
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Center(
              child: Text(
            typeData['type']['name'],
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )),
        ),
      ));
      return typeData['type']['name'];
    }).toList();

// Imprimindo os nomes dos tipos
    Widget buildOptionButton() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            side: BorderSide(
              color: widget.level != null
                  ? getColorForTypeDigimon('${widget.level}')
                  : ColorBorder,
              width: 2,
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: const BoxDecoration(
                        // Cor de fundo
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${widget.id}) ',
                                style: TextStyle(
                                    color: widget.level != null
                                        ? getColorForTypeDigimon('${widget.level}')
                                        : ColorBorder,
                                    fontSize: widget.level != null ? 15 : 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.name,
                                style: TextStyle(
                                    color: widget.level != null
                                        ? getColorForTypeDigimon('${widget.level}')
                                        : ColorBorder,
                                    fontSize: widget.level != null ? 15 : 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          widget.level == null
                              ? Row(
                                  children: types,
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    width: 65,
                                    height: 27,
                                    decoration: BoxDecoration(
                                        color:
                                            getColorForTypeDigimon('${widget.level}'),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Center(
                                        child: Text(
                                      '${widget.level}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )),
                                  ),
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return buildOptionButton();
  }
}
