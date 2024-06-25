import 'package:flutter/material.dart';
import 'package:untitled2/Services/api_services.dart';

class PostCreate extends StatelessWidget {
  const PostCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Create"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: descController,
              decoration: InputDecoration(hintText: 'Description'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ApiServices.createPost(
            titleController.text,
            descController.text,
          );
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
