library snakeapp;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'backend/segment.dart';
part 'common/util.dart';
part 'backend/snake.dart';
part 'backend/controller.dart';
part 'common/elem_box.dart';
part 'backend/apple.dart';
part 'backend/others.dart';

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
  KeyController keyc = new KeyController();
  window.onKeyDown.listen(keyc.keyListener);

  document.addEventListener('swiped-left', (e) {
    print('left');
  });
  document.addEventListener('swiped-right', (e) {
    print('right');
  });
  document.addEventListener('swiped-up', (e) {
    print('up');
  });
  document.addEventListener('swiped-down', (e) {
    print('down');
  });
}

void spawnApple() {
  apple = new Apple();
  if (snake.intersects(apple.rect)) {
    apple.remove();
    spawnApple();
  }
}

void update(num delta) {
  // Move rect
  Rectangle moveRect = snake.calcMoveRect();

  //Move snake
  if (isGameOver(moveRect)) {
    restart();
  } else {
    snake.move();
  }

  //Check for apples
  if (apple.rect.intersects(moveRect)) {
    apple.remove();
    spawnApple();
    score += 100;
    snake.growLength += Apple.DEFAULT_GROWTH;
    scoreUpdated(score);
  }

  window.animationFrame.then(update);
}

void restart() {
  querySelector('#canvas').children.clear();
  snake = new Snake();
  apple = new Apple();
  score = 0;
}

void scoreUpdated(num score) {
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
