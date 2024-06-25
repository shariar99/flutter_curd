import 'package:flutter/material.dart';
import 'package:untitled2/Model/posts_model.dart';
import 'package:untitled2/Pages/post_create.dart';
import 'package:untitled2/Pages/post_details.dart';
import 'package:untitled2/Services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PostsModel>?> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = ApiServices.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PostsModel>?>(
        future: _futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (_, index) {
                final data = posts[index];
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PostDetails(postId: data.id.toString(),),
                      )),
                  child: Card(
                    child: ListTile(

                      title: Text(data.title),
                      subtitle: Text(
                        data.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Navigator.push(context, MaterialPageRoute(builder: (_) => PostCreate()));
        },
        child: Icon(Icons.add),

      ),
    );
  }
}
