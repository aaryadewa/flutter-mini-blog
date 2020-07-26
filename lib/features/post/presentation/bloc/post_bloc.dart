import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_blog/features/post/domain/entity/post.dart';
import 'package:mini_blog/features/post/domain/usecase/post_usecase.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUsecase _usecase;

  PostBloc({@required usecase})
      : this._usecase = usecase,
        super(PostInitial());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostsLoaded) {
      yield* _mapPostsLoadedToState(event);
    } else if (event is PostLoaded) {
      yield* _mapPostLoadedToState(event);
    }
  }

  Stream<PostState> _mapPostsLoadedToState(PostsLoaded event) async* {
    yield PostLoadInProgress();
    print('Loading posts...');
    final response =
        await _usecase.getPosts(page: event.page, limit: event.limit);
    yield response.fold(
        (error) => PostsLoadFailure(), (posts) => PostsLoadSuccess(posts));
  }

  Stream<PostState> _mapPostLoadedToState(PostLoaded event) async* {
    yield PostLoadInProgress();
    print('Loading post#${event.id}');
    final response = await _usecase.getPost(event.id);
    yield response.fold(
        (error) => PostLoadFailure(), (post) => PostLoadSuccess(post));
  }
}
