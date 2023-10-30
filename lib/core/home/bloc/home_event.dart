/// * --------------------------------------------------------------------------- * ///
/// 
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthamchalam
/// created date  : Oct, 28 2023 8:48 Pm
/// 
///  * --------------------------------------------------------------------------- * ///

part of "home_bloc.dart";

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchHomeEvent extends HomeEvent {
  FetchHomeEvent();
}
