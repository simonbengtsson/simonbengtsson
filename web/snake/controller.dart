part of snakeapp;

class ArrowKey {
  static const left = 37;
  static const up = 38;
  static const right = 39;
  static const down = 40;

  static const all = [left, up, right, down];
}

class KeyController {
  KeyController();

  void keyListener(KeyboardEvent evt) {
    // Prevent snake from eating itself right after turn
    if (ArrowKey.all.contains(evt.keyCode)) {
      var lastSegment = snake.segments[snake.segments.length - 1];
      if (lastSegment.length < snake.thickness * 2) {
        lastSegment.length = snake.thickness * 2 + 1;
      }
    }

    switch (evt.keyCode) {
      case ArrowKey.up:
        goUp();
        break;
      case ArrowKey.right:
        goRight();
        break;
      case ArrowKey.down:
        goDown();
        break;
      case ArrowKey.left:
        goLeft();
        break;
    }
  }

  fadeInfoBox() {
    querySelector("#main").style.opacity = "50%";
  }

  goDown() {
    fadeInfoBox();
    if (snake.segments.last is LeftSegment) {
      var pos = snake.segments.last.getNewLeftPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.last._box.width -= Snake.DEFAULT_THICKNESS;
      snake.segments.last._box.x += Snake.DEFAULT_THICKNESS;
      snake.segments.add(new DownSegment(box));
    } else if (snake.segments.last is RightSegment) {
      var pos = snake.segments.last.getNewRightPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.last._box.width -= Snake.DEFAULT_THICKNESS;
      snake.segments.add(new DownSegment(box));
    } else {
      print('Not allowed direction');
    }
  }

  goUp() {
    fadeInfoBox();
    if (snake.segments.last is RightSegment) {
      var pos = snake.segments.last.getNewLeftPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.last._box.width -= Snake.DEFAULT_THICKNESS;
      snake.segments.add(new UpSegment(box));
    } else if (snake.segments.last is LeftSegment) {
      var pos = snake.segments.last.getNewRightPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.last._box.width -= Snake.DEFAULT_THICKNESS;
      snake.segments.last._box.x += Snake.DEFAULT_THICKNESS;
      snake.segments.add(new UpSegment(box));
    } else {
      print('Not allowed direction');
    }
  }

  goRight() {
    fadeInfoBox();
    if (snake.segments.last is UpSegment) {
      var pos = snake.segments.last.getNewRightPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.last._box.height -= Snake.DEFAULT_THICKNESS;
      snake.segments.last._box.y += Snake.DEFAULT_THICKNESS;
      snake.segments.add(new RightSegment(box));
    } else if (snake.segments.last is DownSegment) {
      var pos = snake.segments.last.getNewLeftPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.last._box.height -= Snake.DEFAULT_THICKNESS;
      snake.segments.add(new RightSegment(box));
    } else {
      print('Not allowed direction');
    }
  }

  goLeft() {
    fadeInfoBox();
    if (snake.segments.last is UpSegment) {
      var pos = snake.segments.last.getNewLeftPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.last._box.height -= Snake.DEFAULT_THICKNESS;
      snake.segments.last._box.y += Snake.DEFAULT_THICKNESS;
      snake.segments.add(new LeftSegment(box));
    } else if (snake.segments.last is DownSegment) {
      var pos = snake.segments.last.getNewRightPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.last._box.height -= Snake.DEFAULT_THICKNESS;
      snake.segments.add(new LeftSegment(box));
    } else {
      print('Not allowed direction');
    }
  }
}
