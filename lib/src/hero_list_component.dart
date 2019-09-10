import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'service/hero_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [
    coreDirectives,
  ],
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)

class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;
  Hero selected;
  List<Hero> heroes;

  HeroListComponent(this._heroService, this._router);

  void ngOnInit() => _getHeroes();
  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
    // OR with callbacks/promises
    // _heroService.getAll().then((heroes) => this.heroes = heroes);
  }

  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});
  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}

