/// * --------------------------------------------------------------------------- * ///
///
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthachalam
/// created date  : Nov, 02 2023 10:00 PM
///
///  * --------------------------------------------------------------------------- * ///

import 'package:bloc_master_framework/core/comments/bloc/comments_bloc.dart';
import 'package:bloc_master_framework/core/comments/widgets/comments_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/model/home_model.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({
    Key? key,
    this.data,
  }) : super(key: key);

  final Datum? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentsBloc>(
      create: (context) => CommentsBloc(),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
        child: CommentsWidget(
          data: data,
        ),
      ),
    );
  }
}
