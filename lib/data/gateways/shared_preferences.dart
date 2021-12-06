import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/core/gateways/local_storage.dart';

@LazySingleton(as: LocalStorage)
class TelleoSharedPreferences implements LocalStorage {
  SharedPreferences? sharedPreferences;

  TelleoSharedPreferences();

  Future<void> ensureInitialized() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
  }

  @override
  Future<String?> read(String key) async {
    await ensureInitialized();
    return sharedPreferences!.getString(key);
  }

  @override
  Future<bool> store(String key, String data) async {
    await ensureInitialized();
    return await sharedPreferences!.setString(key, data);
  }
}
