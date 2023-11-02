/// * --------------------------------------------------------------------------- * ///
/// 
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthachalam
/// created date  : Nov, 02 2023 10:00 PM
/// 
///  * --------------------------------------------------------------------------- * ///

part of "comments_bloc.dart";

abstract class CommentsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCommentsEvent extends CommentsEvent {
  final int postId;
  FetchCommentsEvent(this.postId);
}
