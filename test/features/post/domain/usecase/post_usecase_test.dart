import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_blog/features/post/domain/entity/post.dart';
import 'package:mini_blog/features/post/domain/repository/post_repository.dart';
import 'package:mini_blog/features/post/domain/usecase/post_usecase.dart';
import 'package:mockito/mockito.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  PostUsecase usecase;
  MockPostRepository repository;

  setUp(() {
    repository = MockPostRepository();
    usecase = PostUsecase(repository);
  });

  final page = 1;
  final limit = 10;
  final newPost = Post(
      userId: 1, title: 'New Post', body: 'The content body of the new post');
  final createdPost = Post(
      userId: 1,
      id: 3,
      title: 'New Post',
      body: 'The content body of the new post');
  final firstPost = Post(
      userId: 1,
      id: 1,
      title: 'First Post',
      body: 'Long post body of the first post.');
  final posts = <Post>[
    firstPost,
    Post(
        userId: 1,
        id: 2,
        title: 'Second Post',
        body: 'Long post body of the second post.')
  ];

  group('Test post usecases', () {
    test('Should get posts for the given page and limit from the repository',
        () async {
      when(repository.getPosts(page, limit))
          .thenAnswer((_) async => Right(posts));

      await usecase.getPosts(page: page, limit: limit);

      // Verify that the getPosts method has been called on the repository.
      verify(repository.getPosts(page, limit));
      verifyNoMoreInteractions(repository);
    });

    test('Should get post for the given id from the repository', () async {
      when(repository.getPost(1)).thenAnswer((_) async => Right(firstPost));

      await usecase.getPost(1);

      // Verify that the getPosts method has been called on the repository.
      verify(repository.getPost(1));
      verifyNoMoreInteractions(repository);
    });

    test('Should create a post if the post id is not set', () async {
      when(repository.createPost(newPost))
          .thenAnswer((_) async => Right(createdPost));

      await usecase.savePost(newPost);

      // Verify that the getPosts method has been called on the repository.
      verify(repository.createPost(newPost));
      verifyNoMoreInteractions(repository);
    });

    test('Should update a post if the post id set', () async {
      when(repository.createPost(firstPost))
          .thenAnswer((_) async => Right(firstPost));

      await usecase.savePost(firstPost);

      // Verify that the getPosts method has been called on the repository.
      verify(repository.updatePost(firstPost));
      verifyNoMoreInteractions(repository);
    });
  });
}
