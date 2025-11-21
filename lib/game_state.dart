import 'dart:async';
import 'package:flutter/foundation.dart';

class GameState extends ChangeNotifier {
  String _playerName = '';
  int _score = 0;
  int _unlockThreshold = 10;
  bool _autoClickUnlocked = false;
  Timer? _autoClickTimer;

  String get playerName => _playerName;
  int get score => _score;
  int get unlockThreshold => _unlockThreshold;
  bool get autoClickUnlocked => _autoClickUnlocked;

  void setPlayerName(String name) {
    _playerName = name;
    notifyListeners();
  }

  void setUnlockThreshold(double value) {
    _unlockThreshold = value.round();
    notifyListeners();
  }

  void incrementScore([int amount = 1]) {
    _score += amount;
    notifyListeners();
  }

  bool get canUnlockAutoClicker =>
      !_autoClickUnlocked && _score >= _unlockThreshold;

  void unlockAutoClicker() {
    if (!canUnlockAutoClicker) return;
    _score -= _unlockThreshold;
    _autoClickUnlocked = true;
    _startAutoClickTimer();
    notifyListeners();
  }

  void _startAutoClickTimer() {
    _autoClickTimer?.cancel();
    _autoClickTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _score += 1;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _autoClickTimer?.cancel();
    super.dispose();
  }
}
