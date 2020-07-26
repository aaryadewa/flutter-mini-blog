part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  final List<dynamic> properties;

  const PostState([this.properties]);

  @override
  List<Object> get props => properties;

  @override
  bool get stringify => true;
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostsLoadSuccess extends PostState {
  final List<Post> posts;

  PostsLoadSuccess(this.posts) : super([posts]);
}

class PostLoadSuccess extends PostState {
  final Post post;

  PostLoadSuccess(this.post) : super([post]);
}

class PostsLoadFailure extends PostState {}

class PostLoadFailure extends PostState {}

class PostLoadInProgress extends PostState {}
