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

  goDown() {
    //Last was left segment
    if (snake.segments.last is LeftSegment) {
      var pos = snake.segments.last.getNewLeftPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.add(new DownSegment(box));
    }
    //Last was right segment
    else if (snake.segments.last is RightSegment) {
      var pos = snake.segments.last.getNewRightPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.add(new DownSegment(box));
    }
    //Last segment is not allowed
    else {
      print('Not allowed direction');
    }
  }

  goUp() {
    //Last was left segment
    if (snake.segments.last is RightSegment) {
      var pos = snake.segments.last.getNewLeftPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.add(new UpSegment(box));
    }
    //Last was right segment
    else if (snake.segments.last is LeftSegment) {
      var pos = snake.segments.last.getNewRightPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.add(new UpSegment(box));
    }
    //Not allowed
    else {
      print('Not allowed direction');
    }
  }

  goRight() {
    //Last was left segment
    if (snake.segments.last is UpSegment) {
      var pos = snake.segments.last.getNewRightPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.add(new RightSegment(box));
    }
    //Last was right segment
    else if (snake.segments.last is DownSegment) {
      var pos = snake.segments.last.getNewLeftPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.add(new RightSegment(box));
    }
    //Not allowed
    else {
      print('Not allowed direction');
    }
  }

  goLeft() {
    //Last was Up segment
    if (snake.segments.last is UpSegment) {
      var pos = snake.segments.last.getNewLeftPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.add(new LeftSegment(box));
    }
    //Last was Down segment
    else if (snake.segments.last is DownSegment) {
      var pos = snake.segments.last.getNewRightPos();
      ElemBox box = new ElemBox(querySelector('#canvas'), pos.x, pos.y,
          Snake.DEFAULT_THICKNESS, Snake.DEFAULT_THICKNESS);
      snake.segments.add(new LeftSegment(box));
    }
    //Not allowed
    else {
      print('Not allowed direction');
    }
  }
}
