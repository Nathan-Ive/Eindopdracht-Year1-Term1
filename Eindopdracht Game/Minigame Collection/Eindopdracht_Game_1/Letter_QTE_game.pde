//This is the first game.
//The game will be built around the following features
  
  //[Done]1. I'll make code that [recognizes] and [checks] what key was just pressed on the keyboard
  
  
  //[Done]2. I'll make code that [selects a random letter] and [displays it on the screen]
  
  
  //[Done]3. I'll make code that [checks whether or not that letter matches the input that was pressed on the keyboard]
  
  
  //[Done]4. I'll make code that changes the color to green if the input matches, and red if it doesn't
    //I'll also later impliment code that makes the letter shake slightly if the input is wrong
  
  ///[Done] Extra: make the letters into a class so that it can switch between the shown letter easier
  
  
  //[Done]5. I'll make code that counts how many times you pressed the button on screen
  
  
  //6. I'll make code that stops you from pressing any button for 2 seconds as punishment for making a wrong input
    //This can be done by either not regestering any inputs for 2 seconds for every wrong input.
    //Or you can make it so that the letters don't accept good inputs as good or wrong for 2 seconds.
  
  
  //[Done]7. I'll make code that removes the letter from the screen a couple seconds (3-4 seconds) after it shows up
    //This code will switch the random value that dictates what letter is on screen after "x" seconds elapsed
  
  
  //[Done]8. I'll make code that creates a new letter in its place
    //Extra: Seven and eight can be done through or alongside making the letters into a class
  
  
  //[Done]9. I'll make code that shows a visual representation for that timer (A circle closing in on the letter's circle)
  
  
  //[Done]10. I'll make code that keeps count of how many failed and successful inputs you have
  
  
  //11. I'll make a time limit that starts after the first recognized input, represented by a depleting bar at the bottom of the screen
    //This bar can deplete by the incorperated time limit, this has to be done with an equation using "millis()"
  
  
  //12. [I'll make code that stops the game once that time limit is reached], tallying the score and checking how well you did from "bad", "good", "great" "amazing".
    //A "bad" is rewarded if your score is 0%-49% of the requested score, a "good" is given if your score is 50%-89% of the requested score.
    //A "great" is given if your score is 90%-150% of the requested score, and an "amazing" is given if your score is greater than 150% of the requested score.
  
  //If I finished this all within a timely manner for the Eindopdracht, I will write code for varying difficulties followed by code for menu navigation to select those difficulties. 
  
  //After that I'll move on to one of my other ideas, since I eventually want to use all of these features in a game.
  
  
  
  
  //Restructure at the end:
  ///When I'm done writing everything I want to seperate it all into small bits of code based on each class and feature. Done in order of what is based on what.
  ///1. Timer (Stars after first input, ends after time limit is up, and the bar at the bottom that depletes)
  ///2. Letters (Tell you what key to press and change after a few seconds pass after the timer starts, includes the circle that shrinks around the letter's circle.)
  ///3. Score Counter (Tells you the total correct button presses, incorrect button presses, and the percentage between your score and the requested score, giving a grade from bad to amazing)
  ///4. 
  
  
  
  
  //Old Notes:
  
  
  
//I tested some things, and this does create 5 instances of letters contained within a circle.
//That's good, but they have to appear one after the other instead of all at once.
//They're also all the same letter, rather than all being different ones.
  
  
  
//Another circle to show how much time you have left to press it
//A thick line at the bottom that depletes from left to right to show how much time is left for the mini-game
//Code that places each letter in a random, but restricted, area of the screen
//Code that draws and keeps track of the required score and your score
//Code that calculates your percentage and grades your performance once the time is up
///Afterthought: Code that ends the game once the time is up
///Afterthought: Code that lets you restart the game by pressing a button on screen or on the keyboard
///Afterthought:
  
  
//The fix to one of my bugs in my program ended up being that I ordered the if statements wrong.
///The timer circle to show when the letter is about to switch had an if statement to make it false made after its drawing if statement.
///These functions being ordered this way ment that it would always execute the code, set the code to false after shrinking the circle, but then set it to true again when it read all the if statements again.
///Basically, you just need to put things in the right order.


//I notice that I've used a lot of if and else if statements in my code, while I tried doing some switch cases, they never quite worked. I want to learn how to use switch cases in the situations where they would seemingly provide a better function.

//The code I am most proud of is my Letter class, it's because I originally wrote it as a fully normal piece of code but slowly incorperated it into being an object, perfectly replicating what I wanted it to do.
//It even allowed for additional possibliities that I didn't impliment, such as changing the position of where the letter shows up.


  
  
  
  
  
