import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:rpg_game/character.dart';
import 'package:rpg_game/monster.dart';

// 데이터 로드
class Load {
  // 몬스터 파일 로드
  static List<Monster> loadMonster(int defense) {
    final file = File("assets/monsters.txt");
    List<String> monsterLine = file.readAsLinesSync(encoding: utf8);

    // 파일 여부 확인
    if (!file.existsSync()) {
      print("몬스터 파일이 존재하지 않습니다.");
      exit(1);
    } else {
      List<Monster> monster = [];

      for (var line in monsterLine) {
        var parts = line.split(",");

        // 데이터 형식 검증
        if (parts.length != 3) {
          print("몬스터 데이터가 잘못되었습니다.");
          exit(1);
        }

        var maxAttack = int.parse(parts[2]);
        var mon = Monster(
          name: parts[0],
          hp: int.parse(parts[1]),
          attack: 1 + defense + Random().nextInt(maxAttack - defense + 1),
          defense: 0,
        );

        // 공격력 검증
        if (mon.attack <= defense) {
          print("몬스터의 공격력은 캐릭터의 방어력보다 높아야합니다.");
          exit(1);
        }

        monster.add(mon);
      }
      return monster;
    }
  }

  // 캐릭터 데이터 로드
  static Character loadChar(String name) {
    final file = File("assets/character.txt");

    // 파일 여부 확인
    if (!file.existsSync()) {
      print("캐릭터 파일이 존재하지 않습니다.");
      exit(1);
    }

    String line = file.readAsLinesSync(encoding: utf8).first;
    List<String> parts = line.split(",");

    // 데이터 형식 검증
    if (parts.length != 3) {
      print("캐릭터 데이터가 잘못되었습니다.");
      exit(1);
    }

    int hp = int.parse(parts[0]);
    int attack = int.parse(parts[1]);
    int defense = int.parse(parts[2]);

    return Character(name: name, hp: hp, attack: attack, defense: defense);
  }
}

// 데이터 저장
class Save {
  static saveData(String result) {
    var saveresult = result;

    // 파일 생성
    final file = File('assets/result.txt');
    file.writeAsStringSync(saveresult);

    print("저장이 완료되었습니다!");
  }
}
