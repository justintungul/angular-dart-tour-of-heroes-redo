import 'dart:async';

import 'package:angular_tour_of_heroes/src/hero.dart'; // package import
import '../mock_heroes.dart'; // relative import

class HeroService {
  Future<List<Hero>> getAll() async => mockHeroes;

  Future<Hero> get(int id) async =>
      (await getAll()).firstWhere((hero) => hero.id == id);
}

