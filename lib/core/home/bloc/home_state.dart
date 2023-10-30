/// * --------------------------------------------------------------------------- * ///
/// 
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthamchalam
/// created date  : Oct, 28 2023 8:48 Pm
/// 
///  * --------------------------------------------------------------------------- * ///

part of "home_bloc.dart";

abstract class HomeState extends Equatable {}

class FetchHomeInit extends HomeState {
  @override
  List<Object?> get props => [];
}

class FetchHomeLoaded extends HomeState {
  final HomeModel data;

  FetchHomeLoaded({required this.data});
  
  @override
  List<Object?> get props => [data];
}

class FetchHomeFailed extends HomeState {
  final String error;

  FetchHomeFailed(this.error);
  @override
  List<Object?> get props => [error];
}
