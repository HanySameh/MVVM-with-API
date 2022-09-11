import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:mvvm_api/repositories/posts/post_repository.dart';

import '../../models/post_model.dart';

class PostsAPI extends PostsRepository {
  @override
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> posts = [];
    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      List list = response.data;
      posts = list.map((post) => PostModel.fromJson(post)).toList();
    } catch (exception) {
      debugPrint(exception.toString());
    }
    debugPrint(posts.toString());
    return posts;
  }

  @override
  Future<PostModel> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }
}
