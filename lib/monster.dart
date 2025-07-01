import 'package:rpg_game/character.dart';
import 'package:rpg_game/utils.dart';

class Monster extends Utils {
  Monster({
    required super.name,
    required super.hp,
    required super.attack,
    required super.defense,
  });

  void attackCharacter(Character character) {}

  @override
  void showStatus() {
    print("$name - 체력 : $hp, 공격력 : $attack");
  }
}
