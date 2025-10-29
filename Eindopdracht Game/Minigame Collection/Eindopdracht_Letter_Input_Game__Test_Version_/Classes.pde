//The class that represents the letters that appear on screen
class Letters {

  char[] lettersInput = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
  char[] lettersInputCap = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
  int randomValue = (int)random(lettersInput.length);

  float[] letterScreenLocationX = {1024/2};
  float[] letterScreenLocationY = {768/2};
  int randomValueCoordsX = (int)random(letterScreenLocationX.length);
  int randomValueCoordsY =(int)random(letterScreenLocationY.length);


  void showLetter() {
    //Code that draws the shape displaying around the current letter
    fill(255);
    strokeWeight(1);
    ellipse(letterScreenLocationX[randomValueCoordsX] + 10, letterScreenLocationY[randomValueCoordsY] - 15, basicCircleWidth, basicCircleHeight);

    //Code that draws the letter for the player to push, and the color it shows depending on if the input is right or wrong.
    fill(0);
    if (correctInput && !incorrectInput && incorrectInputCooldownActive == false) {
      fill(0, 255, 0);
    } else if (incorrectInput && !correctInput) {
      fill(255, 0, 0);
    }
    textSize(50);
    text(lettersInputCap[randomValue], letterScreenLocationX[randomValueCoordsX], letterScreenLocationY[randomValueCoordsY]);
  }

  //The code that checks if a key was pressed, what key was pressed and whether or not that key was the right or wrong key
  void keyTyped() {

    if (!pressedKey && time < timeLimit && incorrectInputCooldownActive == false) {
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
        //incorrectInputCooldownActive = true;
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
}


class CircleTimer {
  float circleTimerWidth;
  float circleTimerHeight;
  float circleTimerXPos;
  float circleTimerYPos;
  boolean shownCircTimer;

  CircleTimer (float circleTimerXPos, float circleTimerYPos, float circleTimerWidth, float circleTimerHeight) {
    this.circleTimerXPos = circleTimerXPos;
    this.circleTimerYPos = circleTimerYPos;
    this.circleTimerWidth = circleTimerWidth;
    this.circleTimerHeight = circleTimerHeight;
  }

  void showCircleTimer() {
    shownCircTimer = true;

    if (circleTimerWidth <= basicCircleWidth && circleTimerHeight <= basicCircleWidth) {
      shownCircTimer = false;
    }

    if (shownCircTimer) {
      fill(255);
      strokeWeight(3);
      ellipse(circleTimerXPos + 10, circleTimerYPos - 15, circleTimerWidth, circleTimerHeight);
      circleTimerWidth = circleTimerWidth - 0.5;
      circleTimerHeight = circleTimerHeight - 0.5;
    }
  }
}



class ResultScreen {
  int totalScore;
  String[] finalGrading = {"Bad", "Good", "Great", "Amazing"};
  String divider = "|";


  void showResult() {
    if (time >= 10) {
      totalScore = correctInputCounterExceed - incorrectInputCounter;

      if (totalScore >= 0) {
        if (totalScore < 10) {
          text(totalScore, width/2 - 25, height/2 - 80);
        } else if (totalScore > 10 && totalScore <= 50) {
          text(totalScore, width/2 - 50, height/2 - 80);
        } else if (totalScore > requestedPoints) {
          text(requestedPoints, width/2 - 50, height/2 - 80);
        }
        text(divider, width/2 + 5, height/2 - 80);
        text(requestedPoints, width/2 + 30, height/2 - 80);
      }

      if (correctInputCounterExceed - incorrectInputCounter < requestedPoints / 2) {
        text(finalGrading[0], width/2 - 35, height/2 + 80);
      } else if (correctInputCounterExceed - incorrectInputCounter >= requestedPoints / 2 && correctInputCounterExceed - incorrectInputCounter < requestedPoints) {
        text(finalGrading[1], width/2 - 40, height/2 + 80);
      } else if (correctInputCounterExceed - incorrectInputCounter >= requestedPoints && correctInputCounterExceed - incorrectInputCounter < requestedPoints + (requestedPoints/2)) {
        text(finalGrading[2], width/2 - 50, height/2 + 80);
      } else if (correctInputCounterExceed - incorrectInputCounter >= requestedPoints + (requestedPoints/2)) {
        text(finalGrading[3], width/2 - 80, height/2 + 80);
      }
    }
  }
}
