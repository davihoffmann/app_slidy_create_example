
import 'package:app_slidy_create/app/modules/home/repositories/poke_repository.dart';
import 'package:app_slidy_create/app/shared/models/pokemon_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  String text = '';

  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _HomeController(this.repository) {
    fetchPokemons();
  }

  @action
  fetchPokemons() {
    pokemons = repository.getAllPokemons().asObservable();
  }
}
