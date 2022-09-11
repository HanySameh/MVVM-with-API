import 'package:flutter/material.dart';
import 'package:mvvm_api/view_model/post_view_model.dart';

import '../../repositories/posts/posts_api.dart';
import '../../view_model/posts_view_model.dart';

class PostView extends StatelessWidget {
  PostView({super.key});
  final postsViewModel = PostsViewModel(postsRepository: PostsAPI());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
        child: FutureBuilder<List<PostViewModel>>(
          future: postsViewModel.fetchAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var posts = snapshot.data;
              return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(posts![index].title),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
