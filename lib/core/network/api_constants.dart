import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = "https://api.thecatapi.com/v1/";

  static final String catApiKey = dotenv.env['API_KEY'] ?? '';

  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);
  static const Duration connectTimeout = Duration(seconds: 15);

  // Common Endpoints
  static const String breeds = "$baseUrl/breeds?limit=10&page=0";
}
