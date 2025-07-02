import 'dart:convert';
import 'dart:io';

import 'package:rpg_game/character.dart';
import 'package:rpg_game/monster.dart';

// 데이터 로드
class Load {
  // 몬스터 파일 로드
  List<Monster> loadMonster() {
    final file = File("../assets/monster.csv");
    List<String> monsterLine = file.readAsLinesSync(encoding: utf8);

    // 파일 여부 확인
    if (!file.existsSync()) {
      print("파일이 존재하지 않습니다.");
      exit(1);
    } else {
      List<Monster> monster = [];

      // 데이터 리스트에 추가
      for (var line in monsterLine) {
        var parts = line.split(",");
        monster.add(Monster(
          name: parts[0],
          hp: int.parse(parts[1]),
          attack: int.parse(parts[2]),
          defense: 0,
        ));
      }

      // 값 전달
      return monster;
    }
  }

  // 캐릭터 데이터 로드
  Character loadChar() {
    //
  }
}

// 데이터 저장
class Save {
  void saveData(dynamic result) {
    //
  }
}
