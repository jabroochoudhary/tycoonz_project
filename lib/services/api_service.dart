import 'dart:convert';
import 'package:http/http.dart' as http;

import '../app_constants/api_urls.dart';
import 'local_data_saver.dart';

class ApiService {
// Function to make API call and return JSON response
  Future<Map<String, dynamic>> getRequest(String hitUrl) async {
    try {
      final response = await http.get(Uri.parse(AppAPIUrl.baseUrl + hitUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        return jsonData;
      } else {
        print(response.body);
        throw Exception(
            'API call failed with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<http.Response> postRequest(
      String apiUrl, Map<String, dynamic> data) async {
    try {
      final response = await http
          .post(
        Uri.parse(AppAPIUrl.baseUrl + apiUrl),
        body: data,
      )
          .timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Internet Connection is not stable.');
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> postRequestWithHeaderToken(
    String apiUrl,
    Map<String, dynamic> data,
  ) async {
    try {
      final header = await requestHeaders();
      String jsonData = json.encode(data);

      final response = await http
          .post(Uri.parse(AppAPIUrl.baseUrl + apiUrl),
              body: jsonData, headers: header)
          .timeout(
        Duration(seconds: 20),
        onTimeout: () {
          throw Exception('No internet connection');
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception(
            'POST request failed with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to post data: $e ...');
    }
  }

  // launchURL(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (!await launchUrl(uri)) {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future<Map<String, String>> requestHeaders() async {
    String token =
        (await AppLocalDataSaver.getString(AppLocalDataSaver.token))!;

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token.isNotEmpty ? 'Bearer $token' : '',
    };
  }
}
