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
  //rect(50, 0, 50, height-proximity[0]);//electron 1
  //rect(150, 0, 50, height-proximity[1]); //electron 2
  //rect(250, 0, 50, height-proximity[2]); //electron 3
  //rect(350, 0, 50, height-proximity[3]); //electron 4
  if(triggered){
  image(imgs[index], 0, 0, width, height);
  }
  else{
  //blank
  }
}
