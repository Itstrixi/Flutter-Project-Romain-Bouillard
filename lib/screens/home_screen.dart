import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    final game = context.read<GameState>();
    _nameController = TextEditingController(text: game.playerName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Options du jeu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Identifiant',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Entrez votre pseudo',
              ),
              onChanged: (value) {
                game.setPlayerName(value);
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Points necessaires pour debloquer la machine automatique',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    min: 5,
                    max: 50,
                    divisions: 9,
                    value: game.unlockThreshold.toDouble().clamp(5, 50),
                    label: '${game.unlockThreshold}',
                    onChanged: (value) => game.setUnlockThreshold(value),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: Text(
                    '${game.unlockThreshold}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child: const Text('Commencer a jouer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
