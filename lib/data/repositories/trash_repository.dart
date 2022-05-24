import '../dataSources/local/trash_hive.dart';
import '../entities/trash.dart';

class TrashRepository {
  static TrashRepository? _instance;
  static TrashHive? _trashHive;

  static Future<TrashRepository> getInstance() async {
    if (_instance == null) {
      _trashHive = await TrashHive.getInstance();
      _instance = TrashRepository._();
    }
    return _instance!;
  }

  TrashRepository._();

  Future<Trash> insertTrash(Trash trash) async {
    await _trashHive?.insertTrash(trash);
    return trash;
  }
}