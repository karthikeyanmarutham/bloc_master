/// * --------------------------------------------------------------------------- * ///
///
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthamchalam
/// created date  : Oct, 28 2023 8:48 Pm
///
///  * --------------------------------------------------------------------------- * ///

import 'package:bloc_master_framework/core/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  static const route = '/';
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc()
          ..add(
            FetchHomeEvent(),
          ),
        child: const HomeWidget(),
      ),
    );
  }
}
