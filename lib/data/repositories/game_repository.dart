import '../dataSources/local/game_hive.dart';
import '../entities/game.dart';

class GameRepository {
  static GameRepository? _instance;
  static GameHive? _gameHive;

  static Future<GameRepository> getInstance() async {
    if (_instance == null) {
      _gameHive = await GameHive.getInstance();
      _instance = GameRepository._();
    }
    return _instance!;
  }

  GameRepository._();

  Future<Game> insertGame(Game game) async {
    await _gameHive?.insertGame(game);
    return game;
  }
}