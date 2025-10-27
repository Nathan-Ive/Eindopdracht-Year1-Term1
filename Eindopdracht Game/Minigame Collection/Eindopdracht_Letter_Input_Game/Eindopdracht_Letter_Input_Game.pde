//The boolean checking whether or not the key is currently being pressed or not
boolean pressedKey = false;

//The intiger highlighting the amount of points required to win
int requestedPoints = 50;

//the booleans checking whether or not the player pressed the right or wrong inputs
boolean correctInput = false;
boolean incorrectInput = false;

//The intigers that tally how many correct and incorrect inputs were done. Necessary for the final point tally
int correctInputCounter = 0;
int incorrectInputCounter = 0;
int correctInputCounterLIMIT = requestedPoints;
int correctInputCounterExceed = 0;

//All the values relating to time, the time limit, the cooldown or timeloss based on bad inputs, and how long the given letter stays on screen
float incorrectInputCooldownTime = 1;
float timeLimit = 12;
float letterTimer = 2;
int time = 0;


char[] lettersInput = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
char[] lettersInputCap = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
int randomValue = (int)random(lettersInput.length);

float[] letterScreenLocationX = new float[1];
float[] letterScreenLocationY = new float[1];
int randomValueCoordsX = (int)random(letterScreenLocationX.length);
int randomValueCoordsY =(int)random(letterScreenLocationY.length);



void setup() {
  size(1024, 768);

  letterScreenLocationX[0] = width/2;

  letterScreenLocationY[0] = height/2;

  frameRate(60);
}


void draw() {
  background(255);
  //Needed code Notes
  //Text code to draw the letters or words that will appear, showing what the player needs to press
  Letters Letters1 = new Letters (letterScreenLocationX[randomValueCoordsX], letterScreenLocationY[randomValueCoordsY]);
  Letters1.showLetter();




  //temporary input counter
  fill(0);
  text(correctInputCounter, width - 50, height - 100);
  text(incorrectInputCounter, width - 50, height - 300);
  text(correctInputCounterExceed, width - 50, height - 200);
  text(time, 20, 50);

  //Time limit is 10 seconds
  if (time < timeLimit) {
    time = (millis() / 1000);
  }

  //

  //Ellipse code to generate the circle the letters/text will appear within
  //Another circle to show how much time you have left to press it
  //A thick line at the bottom that depletes from left to right to show how much time is left for the mini-game
  //Code that places each letter in a random area of the screen
  //Code that draws and keeps track of the required score and your score
  //Code that calculates your percentage and grade once the time is up
  ///Afterthought: Code that ends the game once the time is up
  ///Afterthought: Code that lets you restart the game by pressing a button on screen or on the keyboard
  ///Afterthought:
}




//The class that represents the letters that appear on screen
class Letters {
  float xLocation;
  float yLocation;

  Letters(float xLocation, float yLocation) {
    this.xLocation = xLocation;
    this.yLocation = yLocation;
  }


  void showLetter() {
    //Code that draws the shape displaying around the current letter
    fill(255);
    ellipse(xLocation + 10, yLocation - 15, 75, 75);

    //Code that draws the letter for the player to push, and the color it shows depending on if the input is right or wrong.
    fill(0);
    if (correctInput == true && incorrectInput == false) {
      fill(0, 255, 0);
    } else if (incorrectInput == true && correctInput == false) {
      fill(255, 0, 0);
    }
    textSize(50);
    text(lettersInputCap[randomValue], xLocation, yLocation);
  }
}



//The code that checks if a key was pressed, what key was pressed and whether or not that key was the right or wrong key
void keyTyped() {

  if (!pressedKey) {
    if (key == lettersInput[randomValue] || key == lettersInputCap[randomValue]) {
      correctInput = true;
      incorrectInput = false;


      if (correctInputCounter < correctInputCounterLIMIT) {
        correctInputCounter++;
      }
      correctInputCounterExceed++;
    } else if (key != lettersInput[randomValue] || key != lettersInputCap[randomValue]) {
      correctInput = false;
      incorrectInput = true;
      incorrectInputCounter++;
    }

    if (correctInput && !incorrectInput) {
      println("pressed " + key);
    } else if (!correctInput && incorrectInput) {
      println("Wrong Button");
    }

    pressedKey = true;
  }
}

void keyReleased() {
  if (pressedKey) {
    pressedKey = false;
  }
  correctInput = false;
  incorrectInput = false;
}








//This code is to check wether or not the input given was wrong or right.
//(This should probably be incorperated into the code that checks whenever a key is pressed rather than be its own seperate code)
///void inputCheck(){
///if(){
///correctInput = true;
///incorrectInput = false;
///}
///if(){
///correctInput = false;
///incorrectInput = true;
///}
///}
