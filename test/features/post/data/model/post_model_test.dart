import 'package:flutter_test/flutter_test.dart';
import 'package:mini_blog/features/post/data/model/post_model.dart';
import 'package:mini_blog/features/post/domain/entity/post.dart';

void main() {
  final post = PostModel(
      userId: 1, id: 1, title: 'Test Post', body: 'Test post content body.');

  test('Should be a subclass of Post entity', () async {
    expect(post, isA<Post>());
  });
}
