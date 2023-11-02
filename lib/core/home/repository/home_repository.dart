/// * --------------------------------------------------------------------------- * ///
/// 
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthamchalam
/// created date  : Oct, 28 2023 8:48 Pm
/// 
///  * --------------------------------------------------------------------------- * ///

import 'dart:async';

import 'package:bloc_master_framework/constant/constant.dart';
import 'package:bloc_master_framework/services/network_client/network_client.dart';

class HomeRepository {

  Future<Map<String, dynamic>> fetchData() async{
     Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
      try{
          final response = await NetworkManager().client.get(EndPoints.postEndpoint);

          if (response.statusCode != 200) {
            throw Exception('Failed Message');
          }

          completer.complete(
            {
              "data" : response.data  
            }
          );
      }catch(e){
          completer.completeError(e);
      }
      
     return completer.future;
  }
}