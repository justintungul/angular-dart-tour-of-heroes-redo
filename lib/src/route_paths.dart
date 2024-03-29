import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
  static final dashboard = RoutePath(path: 'dashboard');
  static final hero = RoutePath(path: '${heroes.path}/:$idParam');
  static final heroes = RoutePath(path: 'heroes');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}