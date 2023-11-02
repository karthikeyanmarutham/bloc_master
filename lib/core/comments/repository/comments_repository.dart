/// * --------------------------------------------------------------------------- * ///
///
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthachalam
/// created date  : Nov, 02 2023 10:00 PM
///
///  * --------------------------------------------------------------------------- * ///

import 'dart:async';

import 'package:bloc_master_framework/constant/constant.dart';
import 'package:bloc_master_framework/services/network_client/network_client.dart';

class CommentsRepository {
  Future<Map<String, dynamic>> fetchData({required int postId}) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await NetworkManager()
          .client
          .get('${EndPoints.commentsEndPoint}$postId');

      if (response.statusCode != 200) {
        throw Exception('Failed Message');
      }

      completer.complete({"commentData": response.data});
    } catch (e) {
      completer.completeError(e);
    }

    return completer.future;
  }
}
