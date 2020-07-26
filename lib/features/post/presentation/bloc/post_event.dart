part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  final List<dynamic> properties;

  PostEvent([this.properties]);

  @override
  List<Object> get props => properties;

  @override
  bool get stringify => true;
}

class PostsLoaded extends PostEvent {
  final int page;
  final int limit;

  PostsLoaded(this.page, this.limit) : super([page, limit]);
}

class PostLoaded extends PostEvent {
  final int id;

  PostLoaded(this.id) : super([id]);
}
