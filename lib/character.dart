import 'package:rpg_game/monster.dart';
import 'package:rpg_game/utils.dart';

class Character extends Utils {
  bool hasItem = true;
  bool usingItem = false;

  Character({
    required super.name,
    required super.hp,
    required super.attack,
    required super.defense,
  });

  // 캐릭터 공격 로직
  void attackMonster(Monster monster) {
    var realAttack = attack;
    if (usingItem) {
      realAttack *= 2;
    }
    print("$name이(가) ${monster.name}에게 $realAttack의 데미지를 입혔습니다.\n");
    monster.hp -= (realAttack - monster.defense);
  }

  // 방어
  void defend(Monster monster) {
    if (monster.attack >= defense) {
      var addHp = monster.attack - defense;
      hp += addHp;
      print("$name이(가) 방어태세를 취하여 $addHp 만큼 체력을 얻었습니다.");
    }
  }

  // 캐릭터 상태창
  @override
  void showStatus() {
    print("$name - 체력 : $hp, 공격력 : $attack, 방어력 : $defense");
  }
}
