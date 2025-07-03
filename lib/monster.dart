import 'package:rpg_game/character.dart';
import 'package:rpg_game/utils.dart';

class Monster extends Utils {
  Monster({
    required super.name,
    required super.hp,
    required super.attack,
    required super.defense,
  });

  // 몬스터 공격 로직
  void attackCharacter(Character character) {
    print("$name의 턴");
    print("$name이(가) ${character.name}에게 $attack의 데미지를 입혔습니다.");
    character.hp -= (attack - character.defense);
  }

  // 몬스터 상태창
  @override
  void showStatus() {
    print("$name - 체력 : $hp, 공격력 : $attack");
  }
}
