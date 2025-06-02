import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "http://127.0.0.1:8000";

  static Future<String> summarizeText(String dialogue) async {
    final url = Uri.parse("$_baseUrl/summarize/");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"dialogue": dialogue}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['summary'];
    } else {
      throw Exception("Özet alınırken hata oluştu: ${response.body}");
    }
  }
}
