// set image width and aspect ratio (height/width), pay special attention for portrait orientations
var imgWidth=600;
var imgAspectRatio=9/16;

//name your image sequence as 'image_1.jpg','image_2.jpg'...here you input the starting number and the ending number
var start=1;
var finish=34;

// change debugging to 0 if you do not want to show the 'hot area'
var showHotArea=0;

//things you don't change. 
var imageNumber;
var n, touched, fixImage;
var nImages=finish-start;
var imgs = [];

//here you define the x, y, width, height of the hot area, where you interact with the movie.
//var hotAreaW=650, hotAreaH=120, hotAreaX=190, hotAreaY=0;
//Maarten Change:
var hotAreaW=imgWidth, hotAreaH=350, hotAreaX=0, hotAreaY=0;

//things you don't change
var r,w;

//things you don't change
function preload() {
  for (var i = start; i<finish; i++) {
    imgs[i-start]=loadImage("img/image_"+str(i)+".jpg");
  }
}

//things you don't change
function setup() {
  if (windowWidth>imgWidth) {
    createCanvas(imgWidth, imgWidth*imgAspectRatio);
    r=1;
  }
  else {
    r=windowWidth/imgWidth;
    createCanvas(windowWidth, windowWidth*imgAspectRatio);
  }
  touched=0;
}

function draw() {
  var down=touchIsDown || mouseIsPressed;
  
  if (down === false){
    if (touched===1) {
    imageNumber=fixImage;
    }
    if (touched===0) {
    imageNumber=0;
    }
  }
  
  println(imageNumber);
  n=ceil(imageNumber);
  image(imgs[n], 0, 0,imgWidth*r,imgWidth*r*imgAspectRatio);
  
  //the two lines of code below shows you where the hot area is. you can delete them in the final prototype
  if (showHotArea==1){
   
    
    fill('rgba(100%,100%,100%,0.5)');
    rect(r*hotAreaX,r*hotAreaY,r*hotAreaW,r*hotAreaH);
    textSize(12);
    textAlign(LEFT);
    fill(0);
    text("Set 'showHotArea=0' in code to remove this",hotAreaX+10,hotAreaY+20);
  }
  
}

//things you don't change
function touchMoved(){
  if ((touchX>r*hotAreaX) && (touchX<r*(hotAreaX+hotAreaW)) && (touchY>r*hotAreaY) && (touchY<r*(hotAreaY+hotAreaH)) 
  ){
  imageNumber=(nImages-1)*(touchX-r*hotAreaX)/(r*hotAreaW);
  fixImage=imageNumber;
  touched=1;
  }
  return false;
}

//things you don't change
function windowResized() {
  w=width;
  if (windowWidth>imgWidth) {
  resizeCanvas(imgWidth, imgWidth*imgAspectRatio);
  r=1;
  }
  else {
    r=windowWidth/imgWidth;
    resizeCanvas(windowWidth, windowWidth*imgAspectRatio);
  }
}


