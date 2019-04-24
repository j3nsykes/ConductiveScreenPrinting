//simple touch board example adapted from BareConductive https://github.com/BareConductive/simple_touch_board_sketch
//modified to send values to Wekinator by Jen Sykes

import processing.serial.*;
int xPos = 1;         // horizontal position of the graph
int index;
float fadeX, fadeY;
int barWidth = 20;
int lastBar = -1;

void setup() {
  //touchBoardSetup();
  size(500, 500);
  colorMode(HSB, height, height, height);  
  noStroke();
  background(0);
}

void draw() {
  background(0);
  //debug();
  //visualise the data


  fadeX =proximity[0];//control fade with proximity of sensor.
  fadeY=proximity[1];//control fade with proximity of sensor.
  
  int whichBar = int(fadeX) / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(fadeY, height, height);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
  }
}


void debug() {
  fadeX=mouseX;
  fadeX=mouseY;
}
