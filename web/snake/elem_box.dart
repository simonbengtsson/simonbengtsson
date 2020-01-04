part of snakeapp;

/**
 * A box who's position and size is set and determined on a div element. 
 * [parent], [x], [y], [width], [height].
 */
class ElemBox {
  Element elem;
  
  ElemBox(Element parent, int x, int y, int width, int height) {
    
    //Element
    elem = new DivElement();
    parent.children.add(elem);
    //elem.style.background = getRandomColor();
    
    //Position and size
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  
  //Right
  num get right => x + width;
  
  //Bottom
  num get bottom => y + height;
  
  //X
  num get x => int.parse(elem.style.left.replaceAll('px', ''));
  set x(num value) => elem.style.left = '$value.px';
  
  //Y
  num get y => int.parse(elem.style.top.replaceAll('px', ''));
  set y(num value) => elem.style.top = '$value.px';
  
  //Width
  num get width => int.parse(elem.style.width.replaceAll('px', ''));
  set width(num value) => elem.style.width = '${value.toInt()}.px';
  
  //Height
  num get height => int.parse(elem.style.height.replaceAll('px', ''));
  set height(num value) => elem.style.height = '${value.toInt()}.px';
  
  String toString() => 'X: $x Y: $y Width: $width Height: $height';
}