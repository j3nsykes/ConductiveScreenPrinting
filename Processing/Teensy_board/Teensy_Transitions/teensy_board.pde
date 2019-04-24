final int baudRate = 57600;
final int numElectrodes = 5;

Serial inPort;  // the serial port
String inString; // input string from serial port
String[] splitString; // input string array after splitting
int[] status, lastStatus;
int[] filteredData;
float[] proximity;
int lf = 10;          // ASCII linefeed
int firstElectrode=0;
int lastElectrode=5;
int numTouchPins = 5; // number of pins to use as touchpins, sending note values. Can lower or increase if want to limit it. 2 or 7.
int [] touch;
int [] touchon ;
int touchThreshold = 3000;
boolean triggered=false;
void updateArraySerial(int[] array) {
  if (array == null) {
    return;
  }

  for (int i = 0; i < min(array.length, splitString.length - 1); i++) {
    try {
      array[i] = Integer.parseInt(trim(splitString[i + 1]));
    } 
    catch (NumberFormatException e) {
      array[i] = 0;
    }
  }
}

void touchBoardSetup() {
  status = new int[numElectrodes];
  lastStatus = new int[numElectrodes];
  filteredData      = new int[numElectrodes];
  proximity      = new float[numElectrodes];
  touch= new int[numTouchPins];
  touchon = new int[numTouchPins];

  printArray((Object[])Serial.list());
  // change the 1 below to the number corresponding to the output of the command above
  inPort = new Serial(this, Serial.list()[3], baudRate); 
  inPort.bufferUntil(lf);
}



void serialEvent(Serial p) {
  inString = p.readString();
  splitString = splitTokens(inString, ": ");

  if (splitString[0].equals("TOUCH")) {
    updateArraySerial(touchon);
  } else if (splitString[0].equals("FDAT")) {
    updateArraySerial(filteredData);
  }

  for (int i = firstElectrode; i < lastElectrode; i++) {
    //constant stream of touch data from electrode E11, E10 and E09

    //printArray("filteredData"+" "+"E"+i+" :"+filteredData[i]);


    proximity[i]= map(filteredData[i], 6000, 2000, 0, 255);
    // printArray("proximity"+" "+"E"+i+" :"+proximity[i]);
  }

  for (int i = firstElectrode; i < lastElectrode; i++) {

    if (filteredData[i] > touchThreshold && touchon[i] == 0) {
      // touched
      println("Electrode " + i + " was touched");
      touchon[i] = 1;
      triggered=true;
      index=i;
    } else if (filteredData[i] < touchThreshold && touchon[i] == 1) {
      // released
      println("Electrode " + i + " was released");
      triggered=false;
      touchon[i] = 0;
    }
  }
}
