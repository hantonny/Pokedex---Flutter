import 'package:flutter/material.dart';
import 'package:pokedex/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Escolha seus pets'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.sports_baseball),
            title: const Text('Pokedex'),
            onTap: () {
                Navigator.of(context).pushReplacementNamed(
                AppRoutes.POKEMON,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.display_settings_outlined),
            title: const Text('Digipedia'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.DIGIMON,
              );
            },
          ),
        ],
      ),
    );
  }
}
