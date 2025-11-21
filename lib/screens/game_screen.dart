import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game_state.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu clicker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (game.playerName.isNotEmpty)
              Text(
                'Bonjour ${game.playerName} !',
                style: const TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Score',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${game.score}',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  game.incrementScore();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    'Cliquer !',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Machine automatique',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (!game.autoClickUnlocked)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Debloquee a ${game.unlockThreshold} points.',
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: game.canUnlockAutoClicker
                                ? () {
                                    game.unlockAutoClicker();
                                  }
                                : null,
                            child: const Text('Debloquer'),
                          ),
                        ],
                      )
                    else
                      const Text(
                        'Active : +1 clic par seconde',
                      ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Retour aux options'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
