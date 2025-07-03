import 'dart:io';
import 'dart:math';

import 'package:rpg_game/character.dart';
import 'package:rpg_game/data.dart';
import 'package:rpg_game/monster.dart';

class Game {
  late Character character;
  late List<Monster> monster;
  late int defeatedCount;

  Game();

  // 게임 시작
  void startGame() async {
    print("캐릭터의 이름을 입력하세요 : ");

    // 입력값 검증
    String? charName = stdin.readLineSync()!;

    // 정규식: 한글(가-힣), 영문 대소문자(A-Za-z)만 허용
    final regex = RegExp(r'^[가-힣a-zA-Z]+$');

    // 조건 검사
    if (charName.trim().isEmpty) {
      print("이름은 비어 있을 수 없습니다.");
      exit(1);
    }

    if (!regex.hasMatch(charName)) {
      print("이름에는 숫자나 특수문자를 사용할 수 없습니다.");
      exit(1);
    }

    print("게임을 시작합니다!");

    character = Load.loadChar(charName);
    monster = Load.loadMonster(character.defense);
    character.showStatus();

    await Future.delayed(Duration(seconds: 2));
    while (true) {
      // 랜덤 몬스터 출현
      var randomMonster = getRandomMonster();
      monster.remove(randomMonster);

      await Future.delayed(Duration(seconds: 2));
      // 전투 진행
      var isWin = await battle(randomMonster);
      if (!isWin) {
        print("${character.name}이(가) 쓰러졌습니다.");
        break;
      }

      print("${randomMonster.name}를 처치하였습니다.");

      if (monster.isEmpty) {
        print("축하합니다! 모든 몬스터를 물리쳤습니다.");
        break;
      }

      print("다음 몬스터와 대결하시겠습니까? y/n");

      // 전투 지속 여부
      bool isContinue = false;
      while (true) {
        String? next = stdin.readLineSync()!.trim();
        if (next == "Y" || next == "y") {
          isContinue = true;
          break;
        } else if (next == "N" || next == "n") {
          isContinue = false;
          break;
        }
        print("다시 입력해주세요.");
      }
      if (!isContinue) break;
    }

    // 게임 결과 저장
    print("결과를 저장하시겠습니까? (y/n)");
    String? saveInput = stdin.readLineSync()!.trim();
    if (saveInput == "Y" || saveInput == "y") {
      var result =
          "${character.name},${character.hp},${character.hp > 0 ? "승리" : "패배"}";
      Save.saveData(result);
    }
  }

  // 전투 진행 로직
  Future<bool> battle(Monster monster) async {
    while (true) {
      // 캐릭터 턴
      print("\n${character.name}의 턴");
      print("행동을 선택하세요 (1: 공격, 2: 방어) : ");

      // 행동 분기
      String? action = stdin.readLineSync()!.trim();
      if (action == "1") {
        character.attackMonster(monster);
        await Future.delayed(Duration(seconds: 2));
        monster.attackCharacter(character);
        monster.showStatus();
      } else if (action == "2") {
        character.defend(monster);
      } else {
        print("잘못된 입력입니다. 다시 입력해주세요!");
        continue;
      }

      await Future.delayed(Duration(seconds: 2));

      // 전투 종료 확인
      if (character.hp <= 0) {
        return false;
      } else if (monster.hp <= 0) {
        return true;
      }

      character.showStatus();
    }
  }

  // 랜덤으로 몬스터 생성
  Monster getRandomMonster() {
    print("\n새로운 몬스터가 나타났습니다!");
    var random = Random();

    int index = random.nextInt(monster.length);
    Monster selecMonster = monster[index];

    selecMonster.showStatus();
    return selecMonster;
  }
}
