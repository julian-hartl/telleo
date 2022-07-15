abstract class LocalStorage {
  Future<bool> store(String key, String data);
  Future<String?> read(String key);
}
