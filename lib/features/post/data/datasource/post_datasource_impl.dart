import 'package:dio/dio.dart';
import 'package:mini_blog/features/post/data/datasource/post_datasource.dart';
import 'package:mini_blog/features/post/data/model/post_model.dart';
import 'package:mini_blog/features/post/domain/entity/post.dart';

class PostDatasourceImpl implements PostDatasource {
  final Dio dio;

  PostDatasourceImpl({this.dio});

  @override
  Future<Post> getPost(int id) async {
    try {
      final response = await dio.get('/posts/$id');
      return PostModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.error;
    }
  }

  @override
  Future<List<Post>> getPosts(int page, int limit) async {
    try {
      final response = await dio.get('/posts/_page=$page&_limit=$limit');
      return (response.data as List<Map<String, dynamic>>)
          .map((element) => PostModel.fromJson(element))
          .toList();
    } on DioError catch (e) {
      throw e.error;
    }
  }
}
