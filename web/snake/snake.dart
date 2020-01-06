part of snakeapp;

class Snake {
  static final int DEFAULT_THICKNESS = 50;
  static final int FIRST_LENGTH = 1;
  static final num DEFAULT_SPEED = 5;
  List<Segment> segments;

  int speed;
  int thickness;
  num growLength;

  Snake(){
    speed = DEFAULT_SPEED;
    thickness = DEFAULT_THICKNESS;
    segments = new List();
    growLength = 400;
    var yMiddle = canvasRect.height/2 - thickness/2;
    ElemBox box = new ElemBox(querySelector('#canvas'), 0, yMiddle.toInt(), FIRST_LENGTH, DEFAULT_THICKNESS);
    segments.add(new RightSegment(box));
  }

  Rectangle calcMoveRect() => segments.last.getMoveRect(speed);

  move(){
    //Extend head segment
    segments.last.length += speed;
    //Shorten tail segment (if snake shouldn't grow)
    if(growLength <= 0) {
      if(segments.first.length - speed <= 0) {
        segments.first.remove();
        segments.removeAt(0);
      } else {
        segments.first.length -= speed;
      }
    } else {
      growLength -= speed;
    }
  }

  bool intersects(Rectangle other) {
    for(int i = 0; i < segments.length; i++) {
      if(segments[i].intersects(other)) {
        return true;
      }
    }
    return false;
  }

  num calcLength(){
    var length = 0;
    for(Segment seg in segments) {
      length += seg.length;
    }
    return length;
  }
}