import 'dart:io';
import 'dart:math';

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
    String? charName = stdin.readLineSync()!;

    print("게임을 시작합니다!");
    character.name = charName;
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
      print("다음 몬스터와 대결하시겠습니까? y/n");

      // 전투 지속 여부
      String? next = stdin.readLineSync()!.trim();
      if (next == "N" || next == "n") {
        break;
      } else {
        //battle();
      }
    }

    String? saveInput = stdin.readLineSync()!.trim();
    if (saveInput == "Y" || saveInput == "y") {
      //save();
    }
    ;
  }

  // 전투 진행 로직
  bool battle(Monster monster) {
    while (true) {
      // 캐릭터 턴
      print("${character.name}의 턴");
      print("행동을 선택하세요 (1: 공격, 2: 방어) : ");

      // 행동 분기
      String? action = stdin.readLineSync()!.trim();

      // 입력 검증 및 행동 출력
      bool actionInput = false;
      while (!actionInput) {
        if (action == "1") {
          print(
              "${character.name}이(가) ${monster.name}에게 ${character.attack}의 데미지를 입혔습니다.");
        } else if (action == "2") {
          print("${character.name}이(가) 방어태세를 취하여 0 만큼 체력을 얻었습니다.");
        } else {
          print("잘못된 입력입니다. 다시 입력해주세요!");
          actionInput = true;
        }
      }

      //while (monster.isNotEmpty) {}

      // 전투 종료 확인
      if (character.hp <= 0) {
        return false;
      } else if (monster.hp <= 0) {
        Monster monsterList = monster;
        // monsterList.removeAt(index);
      }
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
    var random = Random();

    int index = random.nextInt(monster.length);
    Monster selecMonster = monster[index];

    selecMonster.showStatus();
    return selecMonster;
  }
}
