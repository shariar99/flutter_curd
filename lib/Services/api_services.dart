import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled2/Model/post_details_model.dart';
import 'package:untitled2/Model/posts_model.dart';
import 'package:untitled2/utils/api_endpoint.dart';

class ApiServices {
  static Future<List<PostsModel>?> fetchData() async {
    try {
      final response = await http.get(ApiEndpointConfig.allPOst);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final postList = jsonData['results'] as List;

        return postList
            .map((postJson) => PostsModel.fromJson(postJson))
            .toList();
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } on SocketException catch (e) {
      print('Network Error: $e');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<PostDetailsModel?> getSinglePost(String id) async {
    try {
      final response =
      await http.get(Uri.parse('${ApiEndpointConfig.singlePost}/$id'));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return PostDetailsModel.fromJson(decoded['results']);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } on SocketException catch (e) {
      print('Network Error: $e');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
