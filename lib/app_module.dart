import 'package:flutter_modular/flutter_modular.dart';
import 'package:teams/src/pages/home_page.dart';
import 'core/database/hive_db.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(Database.new);
  }

  @override
  void routes(r) {
    // r.child('/', child: (context) => const LoginPage());
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
  }
}
