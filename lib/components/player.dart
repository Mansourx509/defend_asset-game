import 'dart:ui';
import 'package:defend_asset/game_controller.dart';
import 'package:flame/game.dart';

class Player {
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  Rect playRect;
  bool isDead = false;

  Player(this.gameController) {
    maxHealth = currentHealth = 300;
    final size = gameController.tileSize * 1.5;
    playRect = Rect.fromLTWH(gameController.screenSize.width / 2 - size / 2,
        gameController.screenSize.height / 2 - size / 2, size, size);
  }

  void render(Canvas c) {
    Paint color = Paint()..color = Color(0XFF0000FF);
    c.drawRect(playRect, color);
  }

  void update(double t) {
    if (!isDead && currentHealth <= 0) {
      isDead = true;
      gameController.initialize();
    }
  }
}
