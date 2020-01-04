part of snakeapp;

class KeyController {
  KeyController();
  
  void keyListener(Event evt){
    KeyboardEvent kevt = evt as KeyboardEvent;
    
    //So that the snake can't eat itself straight after turn
    if(kevt.keyCode >= 37 && kevt.keyCode <= 40) {
      if(snake.segments[snake.segments.length-1].length < snake.thickness*2){
        snake.segments[snake.segments.length-1].length = snake.thickness*2+1;
      }
    }
    
    switch(kevt.keyCode) {
      
      //Up arrow
      case 38:
          //Last was left segment
          if(snake.segments.last is RightSegment) {
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
          break;
          
      //Right arrow
      case 39:
        //Last was left segment
        if(snake.segments.last is UpSegment) {
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
        break;
        
      //Down arrow
      case 40:
        //Last was left segment
        if(snake.segments.last is LeftSegment) {
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
        break;
        
      //Left arrow
      case 37:
        //Last was Up segment
        if(snake.segments.last is UpSegment) {
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
        break;
    }
  }
}

