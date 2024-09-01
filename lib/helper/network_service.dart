import 'dart:convert';
import 'package:http/http.dart' as http;

final class BaseURL {
  static String appBaseURL = "https://reqres.in/api/";
}

final class RouteService {
  String urlPath;

  String endpoint;

  Map<String, dynamic> parameters;

  Map<String, String>? header;

  RouteService({
    required this.urlPath,
    required this.parameters,
    required this.endpoint,
    Map<String, dynamic>? header,
  }) : header = {
          'Content-Type': 'application/json',
          ...?header,
        };
}

final class NetworkService {
  static Future<T> get<T>({
    required RouteService service,
    required T Function(dynamic json) fromJson,
  }) async {
    final response = await http.get(
      Uri.parse(service.urlPath).replace(queryParameters: service.parameters),
      headers: service.header,
    );
    return _processResponse(response, fromJson);
  }

  // Generic POST request
  static Future<T> post<T>({
    required RouteService service,
    required T Function(dynamic json) fromJson,
  }) async {
    final response = await http.post(
      Uri.parse(service.urlPath),
      headers: service.header,
      body: jsonEncode(service.parameters),
    );
    return _processResponse(response, fromJson);
  }

  // Generic DELETE request
  static Future<T> delete<T>({
    required RouteService service,
    required T Function(dynamic json) fromJson,
  }) async {
    final response = await http.delete(
      Uri.parse(service.urlPath).replace(queryParameters: service.parameters),
      headers: service.header ?? {},
    );
    return _processResponse(response, fromJson);
  }

  // Generic PATCH request
  static Future<T> patch<T>({
    required RouteService service,
    Map<String, dynamic>? parameters,
    required T Function(dynamic json) fromJson,
  }) async {
    final response = await http.patch(
      Uri.parse(service.endpoint).replace(queryParameters: service.parameters),
      headers: service.header ?? {},
      body: jsonEncode(fromJson),
    );
    return _processResponse(response, fromJson);
  }

  // Processing the HTTP response
  static T _processResponse<T>(
    http.Response response,
    T Function(dynamic json) fromJson,
  ) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
