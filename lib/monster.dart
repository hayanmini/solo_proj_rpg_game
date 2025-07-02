import 'package:rpg_game/character.dart';
import 'package:rpg_game/utils.dart';
import 'data.dart';

class Monster extends Utils {
  // 몬스터 생성자
  Monster({
    required super.name,
    required super.hp,
    required super.attack,
    required super.defense,
  });

  // 몬스터 데이터 로드
  List<Monster> monster = Load.loadMonster();

  // 몬스터 공격 로직
  void attackCharacter(Character character) {
    //
  }

  // 몬스터 상태창
  @override
  void showStatus() {
    print("$name - 체력 : $hp, 공격력 : $attack");
  }
}
