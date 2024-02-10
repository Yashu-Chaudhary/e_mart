import 'package:get_storage/get_storage.dart';

class PLocalStorage {
  static final PLocalStorage _instance = PLocalStorage._internal();

  factory PLocalStorage() {
    return _instance;
  }
  PLocalStorage._internal();

  final _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<P>(String key, P value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  P? readData<P>(String key) {
    return _storage.read<P>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
