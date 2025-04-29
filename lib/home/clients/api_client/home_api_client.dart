import 'dart:convert';

import 'package:http/http.dart' as http;


class HomeApiClient {
    Future<String> fetchQuote() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['content'];
    } else {
      throw Exception('Failed to fetch quote');
    }
  }
}