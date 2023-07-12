import 'dart:convert';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/api_result.dart';
import 'package:idb/app/services/logger_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:idb/app/services/token.dart';
import 'package:idb/app/stores/user_store.dart';

/// Generic api call to all endpoints.
///
/// data errors example: possible keys {
///   field1: ['error1'],
///   field2: ['error2', 'error3'],
///   errors: ['error4']}

Future<ApiResult> apiCall(String url, String method, dynamic data, bool isAuth) async {
  var logger = GetIt.I<LoggerService>();

  method = method.toLowerCase();

  final apiUrl = Config.apiUrl;

  if (!url.startsWith('http')) {
    url = apiUrl + url;
  }

  final uri = Uri.parse(url);

  var body = json.encode(data);

  var result = ApiResult(isError: false);
  var headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};

  http.Response response;

  String? token;

  if (isAuth) {
    token = await Token.getToken();
    if (token == null) {
      result.isError = true;
      result.data = {
        'errors': ['The token is not provided.']
      };
      logger.debug([method, data, url, result]);
      return result;
    }
  }

  try {
    if (isAuth) {
      headers['Authorization'] = 'Token ${token!}';
    }

    if (method == 'get') {
      response = await http.get(uri, headers: headers);
    } else if (method == 'post') {
      response = await http.post(uri, body: body, headers: headers);
    } else if (method == 'put') {
      response = await http.put(uri, body: body, headers: headers);
    } else if (method == 'patch') {
      response = await http.patch(uri, body: body, headers: headers);
    } else if (method == 'delete') {
      response = await http.delete(uri, headers: headers);
    } else {
      result.isError = true;
      result.data = {
        'errors': ['Incorrect request method']
      };
      return result;
    }
  } catch (e) {
    result.isError = true;
    result.data = {
      'errors': ['Server error.']
    };
    logger.debug([method, data, url, result]);
    return result;
  }

  int status = response.statusCode;

  if (status == 403) {
    result.isError = true;
    result.data = {
      'errors': ['Forbidden.']
    };

    return result;
  }

  if (status == 404) {
    result.isError = true;
    result.data = {
      'errors': ['Resource not found.']
    };
    logger.debug([method, data, url, result]);
    return result;
  }

  if (status == 500) {
    result.isError = true;
    result.data = {
      'errors': ['Internal server error.']
    };
    logger.debug([method, data, url, result]);
    return result;
  }

  if (status == 204) {
    result.data = {};
    logger.debug([method, data, url, result]);
    return result;
  }

  // dynamic d = json.decode(response.body);
  dynamic d = json.decode(utf8.decode(response.bodyBytes));

  if (status >= 200 && status <= 300) {
    result.data = d;
    logger.debug([method, data, url, result]);
    return result;
  }

  // In all other cases should be valid json object with errors.

  if (d is List) {
    result.isError = true;
    result.data = {
      'errors': ['Unknown error.']
    };
    logger.debug([method, data, url, result]);
    return result;
  }

  dynamic erObj = {};

  if (d['error_code'] != null) {
    if (d['error_code'].toLowerCase() == 'bad token') {
      GetIt.I<UserStore>().logout();
    }
  }

  if (d['detail'] != null) {
    erObj['errors'] = [d['detail']];
  } else if (d['non_field_errors'] != null) {
    erObj['errors'] = [d['non_field_errors']];
  }

  // Other fields
  for (var key in d.keys) {
    erObj[key] = d[key];
  }

  result.isError = true;
  result.data = erObj;
  logger.debug([method, data, url, result]);
  return result;
}
