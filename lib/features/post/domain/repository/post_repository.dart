import 'package:dartz/dartz.dart';
import 'package:mini_blog/core/error/failure.dart';
import 'package:mini_blog/features/post/domain/entity/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getPosts(int page, int limit);

  Future<Either<Failure, Post>> getPost(int id);

  Future<Either<Failure, Post>> createPost(Post post);

  Future<Either<Failure, Post>> updatePost(Post post);
}
