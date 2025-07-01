abstract class Utils {
  String name = "";
  int hp = 0;
  int attack = 0;
  int defense = 0;

  Utils(this.name, this.hp, this.attack, this.defense);

  void showStatus() {
    print("${attack}");
  }
}
