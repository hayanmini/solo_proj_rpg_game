import 'package:rpg_game/character.dart';
import 'package:rpg_game/monster.dart';

class Game {
  Character character;
  List<Monster> monster;
  int defeatedCount;

  Game(this.character, this.monster, this.defeatedCount);

  // 게임 시작
  void startGame() {
    print("캐릭터의 이름을 입력하세요 : ");

    // 값이 제대로 들어오는지 검증

    print("게임을 시작합니다!");
    character.showStatus();

    while (true) {
      // 랜덤 몬스터 출현
      var randomMonster = getRandomMonster();
      monster.remove(randomMonster);

      // 전투 진행
      var result = battle(randomMonster);
      if (!result) {
        print("사망");
        break;
      }

      // 전투 성공
      print("다음 몬스터와 대결하시겠습니까?");

      // if (N) {
      //   break;
      // }
    }
    // save();
  }

  // 전투 진행 로직
  bool battle(Monster monster) {
    while (true) {
      // 캐릭터 턴
      print("${character.name}의 턴");
      print("행동을 선택하세요 (1: 공격, 2: 방어) : ");

      // 행동 분기
      //if (1입력)
      print(
          "${character.name}이(가) ${monster.name}에게 ${character.attack}의 데미지를 입혔습니다.");
      //else (2입력)
      print("${character.name}이(가) 방어태세를 취하여 0 만큼 체력을 얻었습니다.");

      // if (hp <= 0) {
      //   return false;
      // }
      // 상태 출력
      character.showStatus();

      // return true;
      // 몬스터 턴
      print("${monster.name}의 턴");
      print(
          "${monster.name}이(가) ${character.name}에게 ${monster.attack}의 데미지를 입혔습니다.");
    }
  }

  // 랜덤으로 몬스터 생성
  Monster getRandomMonster() {
    print("새로운 몬스터가 나타났습니다!");
    monster[0].showStatus();
    // Random()
    return monster[0];
  }
}
