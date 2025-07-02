import 'package:rpg_game/monster.dart';
import 'package:rpg_game/utils.dart';

class Character extends Utils {
  // 캐릭터 생성자
  Character({
    required super.name,
    required super.hp,
    required super.attack,
    required super.defense,
  });

  // 캐릭터 공격 로직
  void attackMonster(Monster monster) {
    //print("${monster.hp} - ${attack}");
  }

  // 방어
  void defend() {}

  // 캐릭터 상태창
  @override
  void showStatus() {
    print("$name - 체력 : $hp, 공격력 : $attack, 방어력 : $defense");
  }
}
