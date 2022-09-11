import '../models/post_model.dart';
import '../repositories/posts/post_repository.dart';
import 'post_view_model.dart';

class PostsViewModel {
  final String title = "All Posts";
  PostsRepository? postsRepository;
  PostsViewModel({this.postsRepository});

  Future<List<PostViewModel>> fetchAllPosts() async {
    List<PostModel> list = await postsRepository!.getAllPosts();
    return list.map((post) => PostViewModel(postModel: post)).toList();
  }
}