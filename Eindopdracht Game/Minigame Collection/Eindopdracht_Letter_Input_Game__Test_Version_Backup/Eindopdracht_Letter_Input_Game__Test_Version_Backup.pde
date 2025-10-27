//Rules to follow
// Every drawn object has a fill and strokeWeight, any other seperately decided variables as well.
// Everything should be decided based on a handful of timers, either starting depending on input or events.


//The boolean checking whether or not the key is currently being pressed or not
boolean pressedKey = false;

//the booleans checking whether or not the player pressed the right or wrong inputs
boolean correctInput = false;
boolean incorrectInput = false;

//The points and intigers that tally how many correct and incorrect inputs were done. Necessary for the final point tally.
int requestedPoints = 50;
int correctInputCounter = 0;
int incorrectInputCounter = 0;
int correctInputCounterLIMIT = requestedPoints;
int correctInputCounterExceed = 0;
int totalScore;
String[] finalGrading = {"Bad", "Good", "Great", "Amazing"};
String Divider = "|";


///All the values relating to the cooldown or timeloss based on bad inputs
float incorrectInputCooldownTime = 1;
float universalTime = millis();
float cooldownTime = 0;
boolean incorrectInputCooldownActive = false;
int letterTimer = 2;

//The input timers and letter timers work on the same rules of counting down instead of up in the way the timer does. When I find out how that works, I should be able to get my switch case to work.
//The equation I want is (millis() % x) / 1000, but for counting down instead of up. I don't know how to reverse the counting order of the millis function yet, or how to make my own timer without the use of millis.

int timeLimit = 10;
int time = 0;

int limitLetr1 = 3;
int limitLetr2 = limitLetr1 + letterTimer;
int limitLetr3 = limitLetr2 + letterTimer;
int limitLetr4 = limitLetr3 + letterTimer;
int limitLetr5 = timeLimit;

int basicCircleWidth = 75;
int basicCircleHeight = 75;
int timerCircleStartingWidth = 150;
int timerCircleStartingHeight = 150;


void setup() {
  size(1024, 768);

  frameRate(60);
}


Letters Letters1 = new Letters ();
Letters Letters2 = new Letters ();
Letters Letters3 = new Letters ();
Letters Letters4 = new Letters ();
Letters Letters5 = new Letters ();


CircleTimer CircleTimer1 = new CircleTimer (Letters1.letterScreenLocationX[Letters1.randomValueCoordsX], Letters1.letterScreenLocationY[Letters1.randomValueCoordsY], timerCircleStartingWidth, timerCircleStartingHeight);
CircleTimer CircleTimer2 = new CircleTimer (Letters2.letterScreenLocationX[Letters2.randomValueCoordsX], Letters2.letterScreenLocationY[Letters2.randomValueCoordsY], timerCircleStartingWidth, timerCircleStartingHeight);
CircleTimer CircleTimer3 = new CircleTimer (Letters3.letterScreenLocationX[Letters3.randomValueCoordsX], Letters3.letterScreenLocationY[Letters3.randomValueCoordsY], timerCircleStartingWidth, timerCircleStartingHeight);
CircleTimer CircleTimer4 = new CircleTimer (Letters4.letterScreenLocationX[Letters4.randomValueCoordsX], Letters4.letterScreenLocationY[Letters4.randomValueCoordsY], timerCircleStartingWidth, timerCircleStartingHeight);
CircleTimer CircleTimer5 = new CircleTimer (Letters5.letterScreenLocationX[Letters5.randomValueCoordsX], Letters5.letterScreenLocationY[Letters5.randomValueCoordsY], timerCircleStartingWidth, timerCircleStartingHeight);



void draw() {
  background(255);
  //Needed code Notes
  //Text code to draw the letters or words that will appear, showing what the player needs to press

  //temporary input counter, to be replaced by a score counter later.
  fill(0);
  text(correctInputCounter, width - 50, height - 100);
  text(incorrectInputCounter, width - 50, height - 300);
  text(correctInputCounterExceed, width - 50, height - 200);
  text(time, 20, 50);
  text(cooldownTime, 120, 50);

  //Time limit is 12 seconds
  if (time < timeLimit) {
    time = (millis() / 1000);
  }

  //I think this would be nicer as a switch case, but this is the only version of this that works, so I'll leave it this way for now.
  //This code switches the letter that's shown for every couple of seconds that pass.
  if (time >= 0 && time < limitLetr1) {
    CircleTimer1.showCircleTimer();
    Letters1.showLetter();
  } else if (time >= limitLetr1 && time < limitLetr2) {
    CircleTimer2.showCircleTimer();
    Letters2.showLetter();
  } else if (time >= limitLetr2 && time < limitLetr3) {
    CircleTimer3.showCircleTimer();
    Letters3.showLetter();
  } else if (time >= limitLetr3 && time < limitLetr4) {
    CircleTimer4.showCircleTimer();
    Letters4.showLetter();
  } else if (time >= limitLetr4 && time <= limitLetr5) {
    CircleTimer5.showCircleTimer();
    Letters5.showLetter();
  }
}
