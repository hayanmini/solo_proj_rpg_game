import 'package:rpg_game/character.dart';
import 'package:rpg_game/utils.dart';

class Monster extends Utils {
  Monster(super.name, super.hp, super.attack, super.defense);

  void attackCharacter(Character character) {}

  @override
  void showStatus() {}
}
