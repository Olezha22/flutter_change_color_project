import 'package:test_project/home/clients/api_client/home_api_client.dart';

class HomeRepository {
  final apiClient = HomeApiClient();
  // here we can add more clients like firebase or db
  Future<String> fetchQuote() async {
    return apiClient.fetchQuote();
  }
}
