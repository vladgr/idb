import 'package:idb/app/constants/types.dart';
import 'package:mobx/mobx.dart';

part 'base_store.g.dart';

// ignore: library_private_types_in_public_api
class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store implements IStore {
  @observable
  dynamic errors;

  @override
  @action
  void clearErrors() {
    errors = null;
  }

  @override
  @action
  void setError(String key, value) {
    dynamic er = errors;
    er ??= {};
    er[key] = [value];
    errors = er;
  }

  @computed
  bool get hasError {
    if (errors == null) return false;

    for (var key in errors.keys) {
      if (errors[key] != null) {
        var obj = errors[key]!;

        if (obj is List) {
          for (var v in obj) {
            if (v != null) return true;
          }
        } else if (obj != null) {
          return true;
        }
      }
    }

    return false;
  }

  @observable
  bool isInprogress = false;

  @action
  void setInProgress(bool value) {
    isInprogress = value;
  }
}
