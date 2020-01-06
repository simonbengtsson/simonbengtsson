library snakeapp;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'snake/segment.dart';
part 'snake/util.dart';
part 'snake/snake.dart';
part 'snake/controller.dart';
part 'snake/elem_box.dart';
part 'snake/apple.dart';
part 'snake/others.dart';

Rectangle canvasRect;

Snake snake;
Apple apple;
num score;
Timer timer;

bool gPlus = false;
bool theWall = false;
bool colorSnake = false;

void main() {
  canvasRect = querySelector('#canvas').getBoundingClientRect();
  score = 0;
  snake = new Snake();
  spawnApple();
  window.animationFrame.then(update);

  updateHighScore(0);

  KeyController keyc = new KeyController();
  window.onKeyDown.listen(keyc.keyListener);

  document.addEventListener('swiped-left', (e) { keyc.goLeft(); });
  document.addEventListener('swiped-right', (e) { keyc.goRight(); });
  document.addEventListener('swiped-up', (e) {  keyc.goUp(); });
  document.addEventListener('swiped-down', (e) { keyc.goDown(); });
}

void spawnApple() {
  apple = new Apple(snake.thickness);
  if (snake.intersects(apple.rect)) {
    apple.remove();
    spawnApple();
  }
}

unfadeInfoBox() {
  querySelector("#main").style.opacity = "0.95";
}

void update(num delta) {
  Rectangle moveRect = snake.calcMoveRect();

  if (isGameOver(moveRect)) {
    updateHighScore(score);
    restart();
    unfadeInfoBox();
  } else {
    snake.move();
    if (apple.rect.intersects(moveRect)) {
      apple.remove();
      spawnApple();
      score += 100;
      snake.growLength += 200;
      updateScore(score);
    }
    window.animationFrame.then(update);
  }
}

void updateHighScore(score) {
  int highScore;
  try {
    highScore = int.parse(window.localStorage["highscore"] ?? "");
  } catch(e) {
    highScore = 0;
  }

  if (score > highScore) {
    highScore = score;
  }

  window.localStorage["highscore"] = "$highScore";
  querySelector("#highscore").text = "$highScore";
}

void restart() {
  querySelector('#canvas').children.clear();
  snake = new Snake();
  apple = new Apple(snake.thickness);
  score = 0;
  window.animationFrame.then(update);
}

void updateScore(num score) {
  querySelector("#score").text = "$score";
}

/**
 * Is game over if the snake is outside of canvas or if its a cannibal
 */
bool isGameOver(Rectangle moveRect) {
  return isOutsideCanvas(moveRect) || isCannibal(moveRect);
}

bool isOutsideCanvas(Rectangle moveRect) {
  bool isTooLeft = moveRect.left <= 0;
  bool isTooRight = moveRect.left + moveRect.width >= canvasRect.width;
  bool isTooTop = moveRect.top <= 0;
  bool isTooBottom = moveRect.top + moveRect.height >= canvasRect.height;

  return isTooLeft || isTooRight || isTooTop || isTooBottom;
}

bool isCannibal(Rectangle moveRect) {
  for (int i = 0; i < snake.segments.length; i++) {
    if (i != snake.segments.length - 2 && i != snake.segments.length - 1) {
      if (snake.segments[i].intersects(moveRect)) {
        return true;
      }
    }
  }
  return false;
}
