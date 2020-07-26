import 'package:dartz/dartz.dart';
import 'package:mini_blog/core/error/failure.dart';
import 'package:mini_blog/features/post/domain/entity/post.dart';
import 'package:mini_blog/features/post/domain/repository/post_repository.dart';

class PostUsecase {
  final PostRepository repository;

  PostUsecase(this.repository);

  Future<Either<Failure, List<Post>>> getPosts(
      {int page = 1, int limit = 10}) async {
    return await repository.getPosts(page, limit);
  }

  Future<Either<Failure, Post>> getPost(int id) async {
    return await repository.getPost(id);
  }

  Future savePost(Post post) async {
    if (post.id == null) {
      return await repository.createPost(post);
    }

    return await repository.updatePost(post);
  }
}
