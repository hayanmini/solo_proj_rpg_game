import 'package:rpg_game/monster.dart';
import 'package:rpg_game/utils.dart';

class Character extends Utils {
  Character(super.name, super.hp, super.attack, super.defense);

  //@override

  void attackMonster(Monster monster) {
    //print("${monster.hp} - ${attack}");
  }

  // 방어
  void defend() {}

  @override
  void showStatus() {}
}
