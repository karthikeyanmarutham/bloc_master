/// * --------------------------------------------------------------------------- * ///
///
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthamchalam
/// created date  : Oct, 28 2023 8:48 Pm
///
///  * --------------------------------------------------------------------------- * ///

import 'package:bloc_master_framework/core/comments/presentation/comments_page.dart';
import 'package:bloc_master_framework/core/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is FetchHomeLoaded) {
          //success
          return ListView.builder(
            itemCount: state.data.data?.length ?? 0,
            itemBuilder: (context, index) {
              var data = state.data.data?[index];
              return CommentsPage(
                data: data,
              );
            },
          );
        } else if (state is FetchHomeFailed) {
          return Center(child: Text(state.error));
        } else {
          return const Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          );
        }
      },
    );
  }
}
