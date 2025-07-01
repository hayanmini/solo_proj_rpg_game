import 'package:rpg_game/character.dart';
import 'package:rpg_game/game.dart';
import 'package:rpg_game/data.dart';
import 'package:rpg_game/monster.dart';

void main(List<String> arguments) {
  var char = Character(name: "여기다넣으셈", hp: 0, attack: 0, defense: 0);
  var game = Game(char, [Monster(name: "b", hp: 0, attack: 0, defense: 0)], 0);
  game.startGame();
}
