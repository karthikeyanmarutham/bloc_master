/// * --------------------------------------------------------------------------- * ///
/// 
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthachalam
/// created date  : Nov, 02 2023 10:00 PM
/// 
///  * --------------------------------------------------------------------------- * ///

import 'dart:convert';

CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
    final List<CommentDatum>? commentData;

    CommentsModel({
        this.commentData,
    });

    factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        commentData: json["commentData"] == null ? [] : List<CommentDatum>.from(json["commentData"]!.map((x) => CommentDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "commentData": commentData == null ? [] : List<dynamic>.from(commentData!.map((x) => x.toJson())),
    };
}

class CommentDatum {
    final int? postId;
    final int? id;
    final String? name;
    final String? email;
    final String? body;

    CommentDatum({
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });

    factory CommentDatum.fromJson(Map<String, dynamic> json) => CommentDatum(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
