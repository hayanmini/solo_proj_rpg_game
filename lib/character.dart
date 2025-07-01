import 'package:rpg_game/monster.dart';
import 'package:rpg_game/utils.dart';

class Character extends Utils {
  Character({
    required super.name,
    required super.hp,
    required super.attack,
    required super.defense,
  });

  void attackMonster(Monster monster) {
    //print("${monster.hp} - ${attack}");
  }

  // 방어
  void defend() {}

  @override
  void showStatus() {
    print("$name - 체력 : $hp, 공격력 : $attack, 방어력 : $defense");
  }
}
