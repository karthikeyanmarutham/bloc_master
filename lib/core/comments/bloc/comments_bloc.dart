/// * --------------------------------------------------------------------------- * ///
///
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthachalam
/// created date  : Nov, 02 2023 10:00 PM
///
///  * --------------------------------------------------------------------------- * ///

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_master_framework/core/comments/repository/comments_repository.dart';
import 'package:equatable/equatable.dart';
import '../model/comments_model.dart';

part "comments_event.dart";
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(FetchCommentsInit()) {
    on<FetchCommentsEvent>(fetchData);
  }

  var repo = CommentsRepository();

  FutureOr<void> fetchData(
    FetchCommentsEvent event,
    Emitter<CommentsState> emit,
  ) async {
    emit(FetchCommentsInit());

    try {
      final res = await repo.fetchData(postId: event.postId);

      CommentsModel model = CommentsModel.fromJson(res);

      emit(FetchCommentsLoaded(data: model));
    } catch (e) {
      emit(FetchCommentsFailed(e.toString()));
    }
  }
}
