//simple touch board example adapted from BareConductive https://github.com/BareConductive/simple_touch_board_sketch
//modified to send values to Wekinator by Jen Sykes

import processing.serial.*;
int xPos = 1;         // horizontal position of the graph
int index;

boolean triggered=false;

void setup() {
  touchBoardSetup();
  size(400, 400);
  background(0);
}

void draw() {
  background(0);

  //visualise the data
  noStroke();
  fill(255, 0, 0);

  switch(index) {
  case 0:
    //draw something

    rect(0, 0, 200, 200);
    break;

  case 1:
    //draw something
    rect(0, 200, 200, 200);
    break;

  case 2:
    //draw something
    rect(200, 200, 200, 200);
    break;

  case 3:
    //draw something
    rect(200, 0, 200, 200);
    break;
  }
}
