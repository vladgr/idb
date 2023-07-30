// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadStore on _UploadStore, Store {
  late final _$signUploadAsyncAction =
      AsyncAction('_UploadStore.signUpload', context: context);

  @override
  Future<ApiResult> signUpload(String filename, String contentType) {
    return _$signUploadAsyncAction
        .run(() => super.signUpload(filename, contentType));
  }

  late final _$uploadFileAsyncAction =
      AsyncAction('_UploadStore.uploadFile', context: context);

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
