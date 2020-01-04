part of snakeapp;

const int DIRECTION_RIGHT = 1;

/**
 * Contains general segment info.
 */
abstract class Segment {
  ElemBox _box;
  
  Segment(this._box) {
    _box.elem.classes.add('snake');
  }

  int get length;
  int get thickness;
  void set length(num value);
  void move(int speed);
  void expandToWall(Rectangle rect);
  Point getNewLeftPos();
  Point getNewRightPos();
  
  Rectangle getMoveRect(int speed);
  
  bool intersects(Rectangle other) {
    return (_box.x <= other.left + other.width && other.left <= _box.right &&
        _box.y <= other.top + other.height && other.top <= _box.bottom);
  }
  
  void remove() {
    _box.elem.remove();
  }

  String toString() {
    return "$_box";
  }
}


/**
 * Segment moving in the right direction.
 */
class RightSegment extends Segment {
  
  RightSegment(ElemBox box) : super(box);
  
  Rectangle getMoveRect(num speed) => 
      new Rectangle(_box.x + length, _box.y, speed, thickness);
  
  void move(int speed) {
    _box.x += speed;
  }
  
  void expandToWall(Rectangle canvas){
    length += canvas.width - (length + _box.x);
  }
  
  Point getNewRightPos() {
    var x = _box.x + length - thickness;
    var y = _box.y;
    return new Point(x, y);
  }
  
  Point getNewLeftPos() {
    var x = _box.x + length - thickness;
    var y = _box.y;
    return new Point(x, y);
  }
  
  int get length => _box.width;
  set length(num newLength) {
    if(newLength > length) {
      extendWith(newLength - length);
    } else {
      shortenWith(length - newLength);
    }
  }
  
  extendWith(num value) {
    _box.width += value;
  }
  
  shortenWith(num value) {
    _box.width -= value;
    _box.x += value;
  }

  int get thickness => _box.height;
}

/**
 * Segment moving in the up direction.
 */
class UpSegment extends Segment {
  
  UpSegment(ElemBox box) : super(box);
  
  Rectangle getMoveRect(int speed) => 
      new Rectangle(_box.x, _box.y - speed, thickness, speed);
  
  move(int speed) {
    _box.y -= speed;
  }
  
  void expandToWall(Rectangle canvas){
    length += _box.y;
  }
  
  Point getNewRightPos() => new Point(_box.x, _box.y);
  
  Point getNewLeftPos() {
    var x = _box.x;
    var y = _box.y;
    return new Point(x, y);
  }
  
  int get length => _box.height;  
  set length(num newLength) {
    if(newLength > length) {
      extendWith(newLength - length);
    } else {
      shortenWith(length - newLength);
    }
  }
  
  extendWith(num value) {
    _box.y -= value;
    _box.height += value;
  }
  
  shortenWith(num value) {
    _box.height -= value;
  }
  
  int get thickness => _box.width;
}

/**
 * Segment moving downwards.
 */
class DownSegment extends Segment {
  
  DownSegment(ElemBox box) : super(box);
  
  Rectangle getMoveRect(num speed) => 
      new Rectangle(_box.x, _box.y + length, thickness, speed);
  
  move(int speed) {
    _box.y += speed;
  }
  
  void expandToWall(Rectangle canvas){
    length += canvas.height - (length + _box.y);
  }
  
  Point getNewRightPos() {
    var x = _box.x;
    var y = _box.y + length - thickness;
    return new Point(x, y);
  }
  
  Point getNewLeftPos() {
    var x = _box.x;
    var y = _box.y + length - thickness;
    return new Point(x, y);
  }
  
  int get length => _box.height;
  set length(num newLength) {
    if(newLength > length) {
      extendWith(newLength - length);
    } else {
      shortenWith(length - newLength);
    }
  }
  
  extendWith(num value) {
    _box.height += value;
  }
  
  shortenWith(num value) {
    _box.y += value;
    _box.height -= value;
  }
  
  int get thickness => _box.width;
}

/**
 * Segment moving left.
 */
class LeftSegment extends Segment {
  
  LeftSegment(ElemBox box) : super(box);
  
  Rectangle getMoveRect(int speed) {
     return new Rectangle(_box.x - speed, _box.y, speed, thickness);
  }
  
  move(int speed) {
    _box.x -= speed;
  }
  
  void expandToWall(Rectangle canvas){
    length += _box.x;
  }
  
  Point getNewRightPos() {
    var x = _box.x;
    var y = _box.y;
    return new Point(x, y);
  }
  
  Point getNewLeftPos() {
    var x = _box.x;
    var y = _box.y;
    return new Point(x, y);
  }
  
  int get length => _box.width; 
  set length(num newLength) {
    if(newLength > length) {
      extendWith(newLength - length);
    } else {
      shortenWith(length - newLength);
    }
  }
  
  extendWith(num value) {
    _box.x -= value;
    _box.width += value;
  }
  
  shortenWith(num value) {
    _box.width -= value;
  }
  
  int get thickness => _box.height;
}

