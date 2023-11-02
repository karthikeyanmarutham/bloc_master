/// * --------------------------------------------------------------------------- * ///
///
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthachalam
/// created date  : Nov, 02 2023 10:00 PM
///
///  * --------------------------------------------------------------------------- * ///

import 'package:flutter_modular/flutter_modular.dart';

import '../core/home/presentation/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      HomePage.route,
      child: (context) => const HomePage(),
    );
  }
}
