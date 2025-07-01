abstract class Utils {
  String name = "";
  int hp = 0;
  int attack = 0;
  int defense = 0;

  // Utils 생성자
  Utils({
    required this.name,
    required this.hp,
    required this.attack,
    required this.defense,
  });

  // 상태창 출력
  void showStatus();
}
