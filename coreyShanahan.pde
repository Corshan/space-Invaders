/*
 Name: Corey Shanahan
 Student Number: 20093473
 Programme Name: Space Invaders
 
 Description: To start the game left click on the start button and to fire press the spacebutton
 
 Known Bugs/Problems: none i am aware of
 
 Sources:
 Processing Reference-
 https://processing.org/reference/
 
 Ship Image -
 https://toppng.com/spaceship-fighter-ipod-opengameart-space-ship-2d-PNG-free-PNG-Images_180299
 
 Alien Image -
 https://commons.wikimedia.org/wiki/File:Space_invaders_alien.svg
 
 Space Invaders Logo Image -
 https://www.pngwing.com/en/free-png-bzthm
 
 Background Image - 
 https://digitaladdictsblog.com/stellar-space-background-photos/
 */
import javax.swing.JOptionPane;

PImage background;
PImage ship;
PImage alienShip;
PImage logo;

Ship sp;
Alien[] alien;
Bullet bt;

String shipName;
boolean start = false;
boolean fire = false;
boolean endGame = false;
float speed = .2;
int roundsTotal = 3;
int rounds = 0;
int aliensDead;
int score;


void setup() {
  size(700, 600);

  JOptionPane.showMessageDialog(null, "Welcome to Space Invaders", "Space Invaders", JOptionPane.INFORMATION_MESSAGE);
  JOptionPane.showMessageDialog(null, "How To Play: \n To move the ship just move the mouse left and right, \n To fire press the spacebar.", "Space Invaders", JOptionPane.INFORMATION_MESSAGE);


  background = loadImage("images/spaceBackground.jpg");
  ship = loadImage("images/spaceShip2.png");
  alienShip = loadImage("images/pinky.png");
  logo = loadImage("images/spaceInvadersLogo.png");
  sp = new Ship(300, height-100);
  alien = new Alien[30];
  bt = new Bullet(sp.getXCoord(), height-100);
  //creating the aliens and setting their display to be true
  buildAliens();
}

void draw() {
  //this is for the background 
  image(background, 0, 0, width, height);

  // this is the title screen
  if (!start) {
    cursor();
    image(logo, 195, 100, 300, 200);
    buttonPlay(290, 400, "Play", 125);
    buttonQuit(290, 500);
  }

  //this is during the game 
  if (start && !endGame) {
    noCursor();
    scoreBoard();
    bt.display(mouseX+50, bt.getYCoord());
    sp.display();
    sp.move();
    for (int i = 0; i < alien.length; i++) {
      alien[i].display();
    }
    hitDetection();
    alienMove();
    shooting();
    allAliensDead();
    alienWin();
  }

  //this is for when the game ends
  if (endGame) {
    endGame();
  }

  if (roundsTotal < rounds) {
    endGame = true;
  }
}

//------------------//
//     methods      //
//------------------//


// this method detects if the bullet hit an alien, this cycles throught the array checking if a hit happened and if there is a collison it will set the display of the alien to false
void hitDetection() {
  for (int i = 0; i < alien.length; i++) {
    if (alien[i].getAlive()) {
      if (bt.getXCoord() > alien[i].getXCoord() && bt.getXCoord() < (alien[i].getXCoord() + 30) && bt.getYCoord() < alien[i].getYCoord()) {
        alien[i].setAlive(false);
        bt.restart(sp.getXCoord(), sp.getYCoord());
        fire = false;
        aliensDead += 1;
        score += 100;
        println("hit " + i);
      }
    }
  }
}

//this method makes all the aliens move when the game starts 
void alienMove() {
  for (int i = 0; i < alien.length; i++) {
    if (start) {
      alien[i].move(speed);
    }
  }
}

//this creates a button on the title screen to start the game 
void buttonPlay(float xCoord, float yCoord, String word, float size) {
  if (mouseX > xCoord && mouseX < xCoord+125 && mouseY > yCoord && mouseY < yCoord+60) {
    if (mousePressed) {
      if (mouseButton == LEFT) {
        endGame= false;
        shipName(JOptionPane.showInputDialog("Welcome back Captain \n\n " + "Please enter your Ship name: ", "Enter Name"));
        roundsTotal = Integer.parseInt(JOptionPane.showInputDialog("Enter how many rounds you want to play: ", "3"));
        start = true;
        score = 0;
      }
    }
  }
  fill(0, 255, 0);
  rect(xCoord, yCoord, size, 60);
  fill(255);
  textSize(50);
  text(word, xCoord+10, yCoord+50);
}

// this creates a botton to exit the program
void buttonQuit(float xCoord, float yCoord) {
  if (mouseX > xCoord && mouseX < xCoord+125 && mouseY > yCoord && mouseY < yCoord+60) {
    if (mousePressed) {
      if (mouseButton == LEFT) {
        exit();
      }
    }
  }
  fill(255, 0, 0);
  rect(xCoord, yCoord, 125, 60);
  fill(255);
  textSize(50);
  text("Quit", xCoord+10, yCoord+50);
}

// this allows the user to fire a bullet 
void shooting() {
  if (keyPressed) {
    if (key == ' ') {
      fire = true;
    }
  }
  if ( bt.getYCoord() <= 0) {
    bt.restart(sp.getXCoord(), sp.getYCoord());
    fire = false;
  }
  if (fire) {
    bt.move();
  }
}

void allAliensDead() {
  if (aliensDead == alien.length) {
    buildAliens();
    rounds ++;
    speed =+ .3;
    aliensDead = 0;
  }
}

// this is the end screen
void endGame() {
  cursor();
  image(logo, 195, 100, 300, 200);
  text("score: " + score, 200, 440);
  buttonPlay(350, 500, "restart", 180);
  buttonQuit(200, 500);
}

//creates the aliens and and sets their display to true
void buildAliens() {
  for (int i = 1; i <= alien.length/3; i++) { 
    alien[i-1] = new Alien(60*i, 100, speed);
    alien[i-1].display(true);
  }
  for (int i = 11; i <= (alien.length/3)*2; i++) {
    alien[i-1] = new Alien((60*i)-600, 150, speed);
    alien[i-1].display(true);
  }
  for (int i = 21; i <= alien.length; i++) {
    alien[i-1] = new Alien((60*i)-1200, 200, speed);
    alien[i-1].display(true);
  }
}

void alienWin() {
  for (int i = 0; i < alien.length; i++) { 
    if (alien[i].getYCoord()+50 > height-100) {
      endGame = true;
    }
  }
}

void scoreBoard() {
  fill(100);
  rect(0, 0, width, 60);
  fill(255);
  textSize(30);
  text("USS " + shipName, 10, 40);
  text("Score: " + score, 500, 40);
}

void shipName(String name) {

  if (name.length() < 11) {
    shipName = name;
  } else {
    shipName = name.substring(0, 10);
  }
}
