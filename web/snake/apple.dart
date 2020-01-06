part of snakeapp;

class Apple {

  int sideWidth;
  ElemBox box;
  Rectangle rect;
  
  Apple(this.sideWidth) {
    var pos = getRandomPos();
    rect = new Rectangle(pos.x, pos.y, sideWidth, sideWidth);
    box = new ElemBox(querySelector('#canvas'), pos.x, pos.y, sideWidth, sideWidth);
    box.elem.classes.add('apple');  
  }
  
  void remove(){
    box.elem.remove();
  }
  
  Point getRandomPos(){
    Random ran = new Random();
    var maxX = canvasRect.width.toInt() - sideWidth;
    var maxY = canvasRect.height.toInt() - sideWidth;
    var x = ran.nextInt(maxX);
    var y = ran.nextInt(maxY);
    return new Point(x, y);
  }
}