import 'package:untitled2/utils/config.dart';

class ApiEndpointConfig {
  static const String apiUrl = '${ApiConfig.baseUrl}/youtube/public/api/v1';
  static Uri allPOst = Uri.parse('$apiUrl/posts');
  static String singlePost = '$apiUrl/post';
}