import 'package:mini_blog/features/post/domain/entity/post.dart';

abstract class PostDatasource {
  Future<List<Post>> getPosts(int page, int limit);

  Future<Post> getPost(int id);
}
