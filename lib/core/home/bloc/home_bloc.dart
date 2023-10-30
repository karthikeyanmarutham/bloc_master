/// * --------------------------------------------------------------------------- * ///
///
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthamchalam
/// created date  : Oct, 28 2023 8:48 Pm
///
///  * --------------------------------------------------------------------------- * ///

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/home_model.dart';
import '../repository/home_repository.dart';

part "home_event.dart";
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(FetchHomeInit()) {
    on<FetchHomeEvent>(fetchData);
  }

  var repo = HomeRepository();

  FutureOr<void> fetchData(
    FetchHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(FetchHomeInit());
    try {
      var res = await repo.fetchData();

      HomeModel model = HomeModel.fromJson(res);

      emit(FetchHomeLoaded(data: model));
    } catch (e) {
      emit(FetchHomeFailed(e.toString()));
    }
  }
}
