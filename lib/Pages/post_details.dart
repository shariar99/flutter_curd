import 'package:flutter/material.dart';
import 'package:untitled2/Services/api_services.dart';

class PostDetails extends StatelessWidget {
  final String postId;

  const PostDetails({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postId),
      ),
      body: FutureBuilder(
        future: ApiServices.getSinglePost(postId),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
             final post = snapshot.data!;
            return Column(
              children: [
                Image.network(post.thumbnail),
                Text(post.title, style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                Text(post.description),
                ListTile(
                  title: Text(post.author.name),
                  subtitle: Text(post.author.email),

                ),
                Text(post.author.country.name)
              ],
            );
          }
        },
      ),
    );
  }
}
