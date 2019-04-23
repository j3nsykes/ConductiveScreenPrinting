//simple touch board example adapted from BareConductive https://github.com/BareConductive/simple_touch_board_sketch
//modified to send values to Wekinator by Jen Sykes
import processing.video.*;
import processing.serial.*;
int xPos = 1;         // horizontal position of the graph
int index;
Movie movie1, movie2;
float fade;

void setup() {
  //touchBoardSetup();
  size(500, 500);
  background(0);
  movie1 = new Movie(this, "0.mp4");
  movie1.loop();

  movie2 = new Movie(this, "1.mp4");
  movie2.loop();
}

void movieEvent(Movie m) {
  m.read();
}
void draw() {
  background(0);
  //debug();
  //visualise the data
  noStroke();
  fill(200);
  
  fade =proximity[0];//control fade with proximity of sensor. 
  tint(255, 255); //fully on fully transparent 
  image(movie1, 0, 0, width, height);
  tint(255, fade);//0 is fully off 255 is fully on. can change this number to fade in and out 
  image(movie1, 0, 0, width, height);
}


void debug() {
  fade=map(mouseX, 0, width, 0, 255);
}
