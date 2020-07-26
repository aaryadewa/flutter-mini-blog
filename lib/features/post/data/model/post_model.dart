import 'package:flutter/cupertino.dart';
import 'package:mini_blog/features/post/domain/entity/post.dart';

class PostModel extends Post {
  PostModel({@required userId, id, @required title, @required body})
      : super(userId: userId, id: id, title: title, body: body);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'body': body,
      if (id != null) 'id': id
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
