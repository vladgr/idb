typedef SetErrorCallback = void Function(String name, String? error);

typedef BoolCallback = void Function(bool value);

typedef FutureVoidCallback = Future<void> Function();

abstract class IStore {
  void clearErrors();
  void setError(String key, value);
}
