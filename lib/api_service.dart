import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  static const String baseURL = 'https://api.fda.gov/drug/label.json';

  Future<dynamic> searchMedication(String query) async {
    final response = await http.get(Uri.parse('$baseURL?search=$query'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to search medication');
    }
  }
}
