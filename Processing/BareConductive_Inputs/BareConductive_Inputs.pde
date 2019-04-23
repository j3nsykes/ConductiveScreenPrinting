//simple touch board example adapted from BareConductive https://github.com/BareConductive/simple_touch_board_sketch
//modified to send values to Wekinator by Jen Sykes

import processing.serial.*;
int xPos = 1;         // horizontal position of the graph


void setup() {
  touchBoardSetup();
  size(500, 500);
  background(0);

}

void draw() {
  background(0);

  //visualise the data
  noStroke();
  fill(200);
  rect(50, 0, 50, height-proximity[0]);//electron 1
  rect(150, 0, 50, height-proximity[1]); //electron 2
  rect(250, 0, 50, height-proximity[2]); //electron 3
  rect(350, 0, 50, height-proximity[3]); //electron 4
}
