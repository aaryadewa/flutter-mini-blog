import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {@required this.userId,
      this.id,
      @required this.title,
      @required this.body});

  @override
  List<Object> get props => [title];
}
