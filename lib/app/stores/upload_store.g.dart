// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UploadStore on _UploadStore, Store {
  final _$signUploadAsyncAction = AsyncAction('_UploadStore.signUpload');

  @override
  Future<ApiResult> signUpload(String filename, String contentType) {
    return _$signUploadAsyncAction
        .run(() => super.signUpload(filename, contentType));
  }

  final _$uploadFileAsyncAction = AsyncAction('_UploadStore.uploadFile');

  @override
  Future<bool> uploadFile(String url, Uint8List bytes, String contentType) {
    return _$uploadFileAsyncAction
        .run(() => super.uploadFile(url, bytes, contentType));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
