import 'package:dartz/dartz.dart';
import 'package:mini_blog/core/error/exception.dart';
import 'package:mini_blog/core/error/failure.dart';
import 'package:mini_blog/features/post/data/datasource/post_datasource.dart';
import 'package:mini_blog/features/post/domain/entity/post.dart';
import 'package:mini_blog/features/post/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDatasource datasource;

  PostRepositoryImpl({this.datasource});

  @override
  Future<Either<Failure, Post>> createPost(Post post) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Post>> getPost(int id) async {
    try {
      final post = await datasource.getPost(id);
      return Right(post);
    } on ResourceNotFoundException {
      return Left(ResourceNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts(int page, int limit) async {
    try {
      final posts = await datasource.getPosts(page, limit);
      return Right(posts);
    } on ResourceNotFoundException {
      return Left(ResourceNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
