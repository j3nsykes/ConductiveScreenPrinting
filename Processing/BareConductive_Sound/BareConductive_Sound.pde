//simple touch board example adapted from BareConductive https://github.com/BareConductive/simple_touch_board_sketch
//modified to send values to Wekinator by Jen Sykes
import processing.sound.*;
import processing.serial.*;
int xPos = 1;         // horizontal position of the graph
int index;
SoundFile [] soundfiles;
boolean triggered=false;
int totalSounds=4;
int state = 0; // initial state
int prevState = -1; // set to anything initially which is not state 


void setup() {
  touchBoardSetup();
  size(500, 500);
  background(0);
  soundfiles = new SoundFile[totalSounds];  // declaring how many sounds we want to load
  for (int i = 0; i < totalSounds; i++) { // looping through the empty array
    soundfiles[i] = new SoundFile(this, i+".wav"); // populating each 'slot' with a soundfile named '0.wav', '1.wav', '2.mp4'
  }
  soundfiles[state].loop(); // set 1 of the sounds to loop (
}

void draw() {
  background(0);
  //debug();
  //visualise the data
  noStroke();
  fill(200);
  if (index==soundfiles.length) { //reset the starting point if I reach the end of the array
    index=0; //reset too beginning
  }
  if(triggered){
  setState(index);
}
  text("SOUND"+index, width/2, height/2);
}


void setState(int _state) {
  state = _state; // set state variable to _state argument we sent it from switch statement
  if (state != prevState) { // not same as previous?
    prevState = state; // first, set state = _state 
    println("STATE IS: "+state);

    // STOP/PAUSE ALL SOUNDS IN THE ARRAY
    for (SoundFile s : soundfiles) {
      s.stop(); // could also be s.pause() for a different behaviour
    }
    // set the one we have selected to loop
    soundfiles[state].loop();
  }
}

void debug() {
  switch(key) {
  case '0':
    triggered=true;
    index=0; //sound 1
    break;
  case '1':
    triggered=true;
    index=1; //sound 2
    break;
  case '2':
    triggered=true;
    index=2; //sound 3
    break;
  case '3':
    triggered=true;
    index=3; //sound 3
    break;
  }
}
