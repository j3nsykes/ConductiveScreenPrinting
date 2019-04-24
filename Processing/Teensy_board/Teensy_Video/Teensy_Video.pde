//simple touch board example adapted from BareConductive https://github.com/BareConductive/simple_touch_board_sketch
//modified to send values to Wekinator by Jen Sykes
import processing.video.*;
import processing.serial.*;
int xPos = 1;         // horizontal position of the graph
int index;
Movie[] movies;
boolean triggered=false;

void setup() {
  touchBoardSetup();
  size(500, 500);
  background(0);
  movies = new Movie[3];
  for (int i = 0; i<movies.length; i++) {
    movies[i] = new Movie(this, i + ".mp4");
    movies[i].loop();
  }
}

void draw() {
  background(0);
  //debug();
  //visualise the data
  noStroke();
  fill(200);

  //if (triggered) {
  image(movies[index], 0, 0, width, height);

  for (int i = 0; i<movies.length; i++) {
    movies[i].volume(0.0);
  }
  movies[index].volume(1.0);
  //} else {
  //  //blank
  //}
}

void movieEvent(Movie m) {
  m.read();
}

void debug() {
  switch(key) {
  case '0':
    index=0;
    break;
  case '1':
    index=1;
    break;
  case '2':
    index=2;
    break;
  }
}
