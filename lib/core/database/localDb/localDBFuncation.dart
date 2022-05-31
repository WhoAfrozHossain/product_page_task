import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDBFunctions {
  Future<bool> setCart(String key, int count);
  Future<int?> getCart(String key);
}

class LocalDbFunctionImpl extends LocalDBFunctions {
  @override
  Future<bool> setCart(String key, int value) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();

      sp.setInt(key, value);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<int?> getCart(String key) async {
    int? keyValue;

    SharedPreferences sp = await SharedPreferences.getInstance();
    Object? _encodedAuthData = sp.get(key);

    if (_encodedAuthData != null) {
      keyValue = int.parse(_encodedAuthData.toString());
    }

    return keyValue ?? null;
  }
}
