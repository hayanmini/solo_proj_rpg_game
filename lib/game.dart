import 'package:rpg_game/character.dart';
import 'package:rpg_game/monster.dart';

class Game {
  Character character;
  List<Monster> monster = [];
  int defeatedCount = 0;

  Game(this.character, this.monster);

  // 게임 시작
  void startGame() {
    //
  }

  // 전투 진행
  void battle() {
    //행동
  }

  // 랜덤으로 몬스터 생성
  void getRandomMonster() {
    // Random()
  }
}
