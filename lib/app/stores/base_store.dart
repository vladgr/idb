import 'package:idb/app/constants/types.dart';
import 'package:mobx/mobx.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store implements IStore {
  @observable
  dynamic errors;

  @action
  void clearErrors() {
    this.errors = null;
  }

  @action
  void setError(String key, value) {
    dynamic er = this.errors;
    if (er == null) er = {};
    er[key] = [value];
    this.errors = er;
  }

  @computed
  bool get hasError {
    if (this.errors == null) return false;

    for (var key in this.errors.keys) {
      if (this.errors[key] != null) {
        var obj = this.errors[key]!;

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
    this.isInprogress = value;
  }
}
