//simple touch board example adapted from BareConductive https://github.com/BareConductive/simple_touch_board_sketch
//modified to send values to Wekinator by Jen Sykes

import processing.serial.*;
int xPos = 1;         // horizontal position of the graph
int index;
PImage[] imgs;
boolean triggered=false;

void setup() {
  touchBoardSetup();
  size(500, 500);
  background(0);
  imgs = new PImage[5];
  imgs[0] = loadImage("0.jpg");
  imgs[1] = loadImage("1.jpg");
  imgs[2] = loadImage("2.jpg");
  imgs[3] = loadImage("3.jpg");
  imgs[4] = loadImage("4.jpg");
}

void draw() {
  background(0);

  //visualise the data
  noStroke();
  fill(200);

  if(triggered){ //remove the if condition for image to stay on screen 
  image(imgs[index], 0, 0, width, height);
  }
  else{
  //blank
  }
}
