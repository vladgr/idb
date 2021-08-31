typedef void SetErrorCallback(String name, String? error);

typedef Future<void> FutureVoidCallback();

abstract class IStore {
  void clearErrors();
  void setError(String key, value);
}
