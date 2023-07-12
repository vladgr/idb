import 'dart:async';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:idb/app/config.dart';
import 'package:idb/app/models/api_result.dart';
import 'package:idb/app/services/api.dart';

import 'package:idb/app/stores/base_store.dart';
import 'package:mobx/mobx.dart';

part 'upload_store.g.dart';

// ignore: library_private_types_in_public_api
class UploadStore = _UploadStore with _$UploadStore;

abstract class _UploadStore extends BaseStore with Store {
  /// Send request to API that will sign file upload for AWS S3.
  @action
  Future<ApiResult> signUpload(String filename, String contentType) async {
    isInprogress = true;

    dynamic data = {
      'filename': filename,
      'content_type': contentType,
    };

    var result = await apiCall(Config.apiSignUploadUrl, 'POST', data, true);
    isInprogress = false;
    return result;
  }

  /// Returns AWS S3 path for uploaded file or null when error.
  @action
  Future<bool> uploadFile(String url, Uint8List bytes, String contentType) async {
    final uri = Uri.parse(url);

    final Map<String, String> headers = {
      'x-amz-acl': 'public-read',
      'Cache-Control': 'max-age=31536000',
      'content-type': contentType,
    };

    final response = await http.put(uri, headers: headers, body: bytes);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    }

    return false;
  }
}
