/// * --------------------------------------------------------------------------- * ///
/// 
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthachalam
/// created date  : Nov, 02 2023 10:00 PM
/// 
///  * --------------------------------------------------------------------------- * ///

part of "comments_bloc.dart";

abstract class CommentsState extends Equatable {}

class FetchCommentsInit extends CommentsState {
  @override
  List<Object?> get props => [];
}

class FetchCommentsLoaded extends CommentsState {
  final CommentsModel data;

  FetchCommentsLoaded({required this.data});
  
  @override
  List<Object?> get props => [data];
}

class FetchCommentsFailed extends CommentsState {
  final String error;

  FetchCommentsFailed(this.error);
  @override
  List<Object?> get props => [error];
}
