//The code that checks if a key was pressed, what key was pressed and whether or not that key was the right or wrong key




//The code that checks if a key was pressed, what key was pressed and whether or not that key was the right or wrong key
void keyTyped() {
  if (time >= 0 && time < limitLetr1) {
    Letters1.keyTyped();
  } else if (time >= limitLetr1 && time < limitLetr2) {
    Letters2.keyTyped();
  } else if (time >= limitLetr2 && time < limitLetr3) {
    Letters3.keyTyped();
  } else if (time >= limitLetr3 && time < limitLetr4) {
    Letters4.keyTyped();
  } else if (time >= limitLetr4 && time <= limitLetr5) {
    Letters5.keyTyped();
  }
}

void keyReleased() {
  if (time >= 0 && time < limitLetr1) {
    Letters1.keyReleased();
  } else if (time >= limitLetr1 && time < limitLetr2) {
    Letters2.keyReleased();
  } else if (time >= limitLetr2 && time < limitLetr3) {
    Letters3.keyReleased();
  } else if (time >= limitLetr3 && time < limitLetr4) {
    Letters4.keyReleased();
  } else if (time >= limitLetr4 && time <= limitLetr5) {
    Letters5.keyReleased();
  }
}





//  if (incorrectInputCooldownActive) {
//    cooldownTime = 2 - (millis() - universalTime % 2000) / 1000;
//  }
//
//  if (cooldownTime <= 0) {
//    incorrectInputCooldownActive = false;
//    cooldownTime = 1;
