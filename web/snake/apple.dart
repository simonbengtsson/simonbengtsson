part of snakeapp;

class Apple { 
  static final int DEFAULT_SIDE = 50;
  static final int DEFAULT_GROWTH = 200;
  ElemBox box;
  Rectangle rect;
  
  Apple(){
    var pos = getRandomPos();
    rect = new Rectangle(pos.x, pos.y, DEFAULT_SIDE, DEFAULT_SIDE);
    box = new ElemBox(querySelector('#canvas'), pos.x, pos.y, DEFAULT_SIDE, DEFAULT_SIDE);
    box.elem.classes.add('apple');  
  }
  
  void remove(){
    box.elem.remove();
  }
  
  Point getRandomPos(){
    Random ran = new Random();
    var maxX = canvasRect.width.toInt() - DEFAULT_SIDE;
    var maxY = canvasRect.height.toInt() - DEFAULT_SIDE;
    var x = ran.nextInt(maxX);
    var y = ran.nextInt(maxY);
    return new Point(x, y);
  }
}