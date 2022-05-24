import 'package:hive/hive.dart';
import 'package:mautus_flutter/data/entities/game.dart';

class GameHive {
  static GameHive? _instance;
  static Box<Game>? _box;

  static Future<GameHive> getInstance() async {
    if (_instance == null) {
      _box = await Hive.openBox('Word');
      _instance = GameHive._();
    }
    return _instance!;
  }

  GameHive._();

  Future<void> insertGame(Game game) async {
    await _box?.add(game);
    // await _box?.close();
    return;
  }
}