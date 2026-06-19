import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("API Explorer"),
      ),

      body: FutureBuilder<List<Post>>(

        future: apiService.fetchPosts(),

        builder: (context, snapshot) {

          // Loading
          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error
          if (snapshot.hasError) {

            return Center(
              child: Text(
                "Error: ${snapshot.error}",
              ),
            );
          }

          // Success
          final posts = snapshot.data!;

          return ListView.builder(

            itemCount: posts.length,

            itemBuilder: (context, index) {

              return Card(
                margin: const EdgeInsets.all(10),

                child: ListTile(
                  title: Text(posts[index].title),
                  subtitle: Text(posts[index].body),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
