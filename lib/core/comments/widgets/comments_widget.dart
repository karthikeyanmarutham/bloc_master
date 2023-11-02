/// * --------------------------------------------------------------------------- * ///
///
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthachalam
/// created date  : Nov, 02 2023 10:00 PM
///
///  * --------------------------------------------------------------------------- * ///

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home/model/home_model.dart';
import '../bloc/comments_bloc.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    Key? key,
    this.data,
  }) : super(key: key);

  final Datum? data;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentsBloc, CommentsState>(
      listener: (context, state) {
        // listen here for all the state
        if (state is FetchCommentsLoaded) {
          Modular.to.pop();
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListView(
                children: List.generate(
                  state.data.commentData?.length ?? 0,
                  (index) => Card(
                    child: SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 45,
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.data.commentData?[index].name ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Expanded(
                              child: Text(
                                state.data.commentData?[index].body ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }

        if (state is FetchCommentsFailed) {
          Modular.to.pop();
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Text(state.error);
            },
          );
        }

        if (state is FetchCommentsInit) {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              );
            },
          );
        }
      },
      child: Card(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.title ?? '-',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(data?.body ?? '-'),
              ],
            ),
          ),
          onTap: () {
            // event call
            BlocProvider.of<CommentsBloc>(context).add(
              FetchCommentsEvent(
                data?.id ?? 0,
              ),
            );
          },
        ),
      ),
    );
  }
}
