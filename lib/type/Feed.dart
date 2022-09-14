class Feed {
  User? user;
  String? location;
  String? text;
  List<Like>? like_list;
  String? image_path;
  List<Comment>? comment_list;

  Feed(
      {required this.user,
      required this.location,
      required this.text,
      required this.like_list,
      required this.image_path,
      required this.comment_list});
}

class Comment {
  String? user_name;
  String? comment;
  DateTime? date;

  Comment({
    required this.user_name,
    required this.comment,
    required this.date,
  });
}

class User {
  String? user_name;
  String? user_image_path;

  User({required this.user_name, required this.user_image_path});
}

class Like {
  String? user_name;

  Like({required this.user_name});
}
