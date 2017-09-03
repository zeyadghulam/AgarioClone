Background back1 = new Background (50, 900, 50, 255, 0, 0); //red, bottom left
Background back2 = new Background (540, 100, 100, 255, 255, 0);//yellow, middle-ish
Background back3 = new Background (100, 500, 30, 0, 0, 255);//small blue, bottom half
Background back4 = new Background (1200, 350, 60, 255, 150, 255);//pink, top right
Background back5 = new Background (1100, 150, 90, 255, 0, 255);//purple,right side
Background back7 = new Background (100, 150, 100, 26, 237, 207);//teal,left side
Background back8 = new Background (1024, 789, 34, 53, 26, 237);//dark blue,right side
Background back9= new Background (1211, 600, 150, 26, 237, 42);//green,right side
Background back10 = new Background (230, 600, 99, 255, 104, 27);//orange,bottom left
PImage EnterName, menuscreen, instructions, Credits, EasyWinScrn, Gameover, NextLevel, volbut;
PImage InstructionsEasy, InstructionsMedium, InstructionsHard, virus, start, HomeScreen, exit, Options, Replay, TryAgain;
ArrayList <StaticB> alStaticCells = new ArrayList <StaticB> ();
ArrayList <MovingB> alMovingCells = new ArrayList <MovingB> ();
ArrayList <VirusB> alVirusCells = new ArrayList <VirusB> ();
String [] names = new String[29];
String sMsg, sMsg2, myText = "";
String sName;
float fNumStaticBalls, fNumMovingBalls, fNumVirusBalls, CameraZoom, gridSize;
int EASYSCORE, MEDIUMSCORE, HARDSCORE;
int playerScore, highplayerScore, gameState = 0, nWinEasyScore, nWinMediumScore, nWinHardScore;
boolean bPause = false, bVol = false, bEasy = true, bMedium = false, bHard = false;
PFont font;
PlayerB PlayerCell;
Timer tm;
ColourSelector CS;
GrayScaleSelector GSS;
void setup() {
  fullScreen();
  //size(displayWidth, displayHeight);
  //We have decided to call the images 
  //from the setup rather than from objects
  //themselves due to lagness issues.
  EASYSCORE= 250;
  MEDIUMSCORE = 400;
  HARDSCORE = 500;
  EnterName = loadImage("keyboard.jpg");
  EnterName.resize(width, height);
  menuscreen = loadImage("menuscreen.jpg");
  menuscreen.resize(width, height);
  instructions = loadImage("Instructions.png");
  instructions.resize(width, height);
  Credits = loadImage("Credits.png");
  Credits.resize(width, height);
  EasyWinScrn = loadImage("winning.jpg");
  EasyWinScrn.resize(width, height);
  Gameover = loadImage("gameover.jpg");
  Gameover.resize(width, height);
  InstructionsEasy = loadImage("DifficultyEasy.jpg");
  InstructionsEasy.resize(width, height);
  InstructionsMedium = loadImage("DifficultyMedium.jpg");
  InstructionsMedium.resize(width, height);
  InstructionsHard = loadImage("DifficultyHard.jpg");
  InstructionsHard.resize(width, height);
  virus = loadImage("virus.png");
  start = loadImage("start.png");
  HomeScreen = loadImage("gameScreen.jpg");
  HomeScreen.resize(width, height);
  Options = loadImage("skyblue.jpg");
  Options.resize(width, height);
  exit = loadImage("exit.png");
  NextLevel = loadImage("advance arrow.png");
  NextLevel.resize(600, 600);
  volbut = loadImage("volumebutton.png");
  volbut.resize(75, 75);
  Replay = loadImage("replay.jpg");
  Replay.resize(100, 100);
  TryAgain = loadImage("tryagain.jpg");
  Easy();
  bEasy = true;
  setupSound();
  runSound();
  tm = new Timer();
  tm.start();
  CS = new ColourSelector(width/2 - (width/3), height/2 - (height/6), 500, 200, 150);
  GSS = new GrayScaleSelector(width/2 + (width/11), height/2 - (height/6), 200, 200, 255);
  PlayerCell = new PlayerB (50);  // 50 is the player's diameter
  //Static Cells are implemeneted
  for (int i= 0; i < fNumStaticBalls; i++) {
    alStaticCells.add(new StaticB());
  }
  smooth();
  //MovingCells are implemnted
  for (int i=0; i < fNumMovingBalls; i++) {
    alMovingCells.add(new MovingB());
  }
  smooth();
  //VirusCells are implemnted
  for (int i=0; i < fNumVirusBalls; i++) {
    alVirusCells.add(new VirusB());
  }
  NameStoring(); //Calls listed names
}

void draw() {
  //gameState 2 == play screen
  if (gameState == 2) {
    drawGrid();
    //Static Balls displayed (Enhanced Loop)
    for (StaticB staticB : alStaticCells) {
      staticB.display();
    }
    //Player vs. Static balls
    for (int i = 0; i < alStaticCells.size(); i++) {
      addStaticBalls();                                            
      isPlayerHitStatic(PlayerCell, alStaticCells.get(i));
    }
    //Moving Ball displayed (Enhanced Loop)
    for (MovingB movingB : alMovingCells) {
      movingB.run();
    }
    //Moving vs. Moving
    for (int a = 0; a < alMovingCells.size(); a++) {
      for (int b = 0; b < alMovingCells.size(); b++) {
        isMovingHitMoving(alMovingCells.get(a), alMovingCells.get(b));
      }
    }
    //Moving vs. Static
    for (int o = alMovingCells.size()-1; o >= 0; o--) {
      for (int p = alStaticCells.size()-1; p >= 0; p--) {
        isMovingHitStatic(alMovingCells.get(o), alStaticCells.get(p));
      }
    }
    //Player vs. Moving
    for (int i = 0; i < alMovingCells.size(); i++) {
      isPlayerHitMoving(PlayerCell, alMovingCells.get(i));
      if (bMedium == true && bEasy == false && bHard == false) {
        isPlayerHitMoving2(PlayerCell, alMovingCells.get(i));
      }
    }
    //Moving vs. Player
    for (int j = 0; j < alMovingCells.size(); j++) {
      isMovingHitPlayer(alMovingCells.get(j), PlayerCell);
    }
    //Virus balls displayed (Enhanced Loop)
    for (VirusB virusB : alVirusCells) {
      virusB.display();
    }
    //Virus vs. Player
    for (int k = alVirusCells.size()-1; k >= 0; k--) {
      isPlayerHitVirus(PlayerCell, alVirusCells.get(k));
    }
    //Virus vs. Moving
    for (int q = 0; q < alMovingCells.size(); q++) {
      for (int l = 0; l < alVirusCells.size(); l++) { 
        isMovingHitVirus(alMovingCells.get(q), alVirusCells.get(l));
      }
    }
    //displays time to the game
    time();
    //displays the current level
    displayLevel();
    //calls the player's cell properties
    PlayerCell.runPlayerCell();
    //displays the player's score
    playerScore();
    //calls the keyboard function
    Keyboard();
  }
  //pause screen 
  if (keyPressed && (key == 'p' || key == 'P')) {     
    PlayerCell.Pause();
  }
  //game screen
  if (gameState == 0) {
    //runs the background data that are at the very top of the code.
    backgroundData();
  } else if (gameState == 1) {
    //displays the menu buttons
    MenuScreen();
    Instructions();
    Options();
    Credits();
  } else if (gameState == 3) {
    //Intructions
    background(255);
    Instructions();
  } else if (gameState == 4) {
    //Options menu with all of it's colour changing properties
    background(Options);
    Options();
    CS.drawGradient();
    CS.paint();
    GSS.drawGradient();
    GSS.grayPaint();
  } else if (gameState == 5) {
    //Credits
    background(255);
    Credits();
  } else if (gameState == 6) {
    //Gameover screen
    GameOver();
  } else if (gameState == 7) {
    //Keyboard function
    Keyboard();
  } else if (gameState == 8) {
    //winning screen for easy level
    winEasyScreen();
  } else if (gameState == 9) {
    //Easy level instructions screen
    InstructionsEasy();
  } else if (gameState == 10) {
    //winning screen for medium level
    winMediumScreen();
  } else if (gameState == 11) {
    //winning screen for hard level
    winHardScreen();
  } else if (gameState == 12) {
    //Medium level instructions screen
    InstructionsMedium();
  } else if (gameState == 13) {
    //Hard level instructions screen
    InstructionsHard();
  }
  if (keyPressed && gameState == 0) {
    //switches screen from intro screen to menu screen
    gameState = 1;
  }
  println(frameRate);
}
void mouseReleased() {
  if (gameState == 0) {
    gameState = 1;
  }
}
//*/*/*/*/*//*/*/*//*//*/*//*//*///*///*///*//*///*//*/*/Collision Detection//*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*///*/**/*/*/*/
//Collision with Player vs. Static
void isPlayerHitStatic(PlayerB PlayerCell, StaticB Static) {
  noStroke();
  float collide;
  collide = dist(CameraZoom*(Static.fX - PlayerCell.fX), CameraZoom*(Static.fY - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
  if (collide < PlayerCell.fDiameter/2) {// the 2.5 controls the distance between the static ball and the player's ball, increase to attract slower, decrease to attract faster.
    PlayerCell.fDiameter = PlayerCell.fDiameter + Static.nDiameter/Static.nDiameter;  // Now the PlayerCell.fDiameter increases by ones. Mass increases by ones.
    CameraZoom = CameraZoom - Static.nDiameter/100;
    alStaticCells.remove(Static);
  }
}
//Collision with Moving vs. Static
void isMovingHitStatic(MovingB Moving, StaticB Static) {
  float distance = dist(Moving.fX, Moving.fY, Static.fX, Static.fY); 
  if (distance < 3) {
    Moving.fDiameter = Moving.fDiameter + (Static.nDiameter * 2);
    alStaticCells.remove(Static);
  }
}
//Collision with Player vs. Moving
void isPlayerHitMoving(PlayerB PlayerCell, MovingB Moving) {
  if (PlayerCell.fDiameter > Moving.fDiameter) {
    noStroke();
    float collide;
    collide = dist(CameraZoom*(Moving.fX - PlayerCell.fX), CameraZoom*(Moving.fY - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
    if (collide < PlayerCell.fDiameter/2) {
      PlayerCell.fDiameter = PlayerCell.fDiameter + (Moving.fDiameter/5);  
      alMovingCells.remove(Moving);
    }
  }
}

void isPlayerHitMoving2(PlayerB PlayerCell, MovingB Moving) {
  if (PlayerCell.fDiameter > Moving.fDiameter) {
    float collide;
    collide = dist(CameraZoom*(Moving.fX - PlayerCell.fX), CameraZoom*(Moving.fY - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
    if (collide <= PlayerCell.fDiameter * 1.4 && collide >= PlayerCell.fDiameter * 1.5 || collide <= PlayerCell.fDiameter * 1.5 && collide >= PlayerCell.fDiameter * 1.4) {
      Moving.fDx = -Moving.fDx;
      Moving.fDy = -Moving.fDy;
    } else if (collide > PlayerCell.fDiameter * 1.5) {
      Moving.fDx = Moving.fDx;
      Moving.fDy = Moving.fDy;
    }
  } else if (PlayerCell.fDiameter < Moving.fDiameter) {
    Moving.fDx = Moving.fDx;
    Moving.fDy = Moving.fDy;
  }
}


//Collision with Moving vs. Player
void isMovingHitPlayer(MovingB Moving, PlayerB Player) {
  if (Moving.fDiameter > Player.fDiameter) {
    noStroke();
    float collide;
    collide = dist(CameraZoom*(Moving.fX - PlayerCell.fX), CameraZoom*(Moving.fY - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
    if (collide < Moving.fDiameter/2) {
      Moving.fDiameter = Moving.fDiameter + Player.fDiameter/2;  
      gameState=6;
      playerScore = playerScore - playerScore;
    }
  }
}
//Collision with Moving vs. Moving
void isMovingHitMoving(MovingB Moving1, MovingB Moving2) {
  if (Moving1.fDiameter > Moving2.fDiameter) {
    float distance = dist(Moving1.fX, Moving1.fY, Moving2.fX, Moving2.fY);
    if (distance < Moving2.fDiameter/18) {
      Moving1.fDiameter = Moving1.fDiameter + (Moving2.fDiameter/4);
      alMovingCells.remove(Moving2);
    }
  } else if (Moving2.fDiameter > Moving1.fDiameter) {
    float distance = dist(Moving1.fX, Moving1.fY, Moving2.fX, Moving2.fY);
    if (distance < Moving1.fDiameter/18) {
      //Moving1.fDiameter = Moving1.fDiameter + (Moving2.fDiameter/4);
      Moving2.fDiameter = Moving2.fDiameter + (Moving1.fDiameter/4);
      alMovingCells.remove(Moving1);
    }
  }
}
//Collision with Player vs. Virus
void isPlayerHitVirus(PlayerB Player, VirusB Virus) {
  noStroke();
  float collide;
  collide = dist(CameraZoom*(Virus.fX - Player.fX), CameraZoom*(Virus.fY - Player.fY), (0 - Player.fX)/CameraZoom + width/2, (0-Player.fY)/CameraZoom + height/2);
  if (collide < Player.fDiameter/2) {
    Player.fDiameter = Player.fDiameter - Player.fDiameter/Virus.nDiameter;
    alVirusCells.remove(Virus);
  }
}
//Collision with Moving vs. Virus
void isMovingHitVirus(MovingB Moving, VirusB Virus) {
  if (Moving.fDiameter > Virus.nDiameter) {
    float distance = dist(Moving.fX, Moving.fY, Virus.fX, Virus.fY); 
    if (distance < Moving.fDiameter/16) {
      Moving.fDiameter = Moving.fDiameter - Moving.fDiameter/Virus.nDiameter;
      alVirusCells.remove(Virus);
    }
  } else if (Moving.fDiameter < Virus.nDiameter) {
    float distance = dist(Moving.fX, Moving.fY, Virus.fX, Virus.fY); 
    if (distance < Moving.fDiameter/16) {
      alMovingCells.remove(Moving);
    }
  }
}

//Eaten Static balls are replaced with newer ones
void addStaticBalls() {
  for (int i = 0; i < alStaticCells.size(); i++) {
    while (fNumStaticBalls != alStaticCells.size()) {
      alStaticCells.add(new StaticB());   // the fX, and fY will be randomized;
      fNumStaticBalls = alStaticCells.size();
      //println(alStaticCells.size() + " ball is added");
    }
  }
}
//Eaten Viruses are replaced with newer ones
void addVirusballs() {
  for (int i = 0; i < alVirusCells.size(); i++) {
    while (fNumVirusBalls != alVirusCells.size()) {
      alVirusCells.add(new VirusB());
      fNumVirusBalls = alVirusCells.size();
    }
  }
}
//Player playerScore & high playerScore
void playerScore() {
  playerScore = (int(PlayerCell.fDiameter));
  if (highplayerScore <= playerScore) {
    highplayerScore = max(int(PlayerCell.fDiameter), int(PlayerCell.fDiameter));
  } 
  rectMode(CORNER);
  fill(255);
  rect(width/68, height - (height/15), 155, 40);
  fill(0);
  text("Score : " + playerScore, width/14, height - (height/30));
  fill(255);
  rect(width/52, height/45, 240, 40);
  fill(0);
  text(" High Score : " + highplayerScore, width/10, height/16 - 10);
  fill(255);
  if (playerScore >= nWinEasyScore && bEasy == true && bMedium == false && bHard == false) { // when the player reaches to the easy winning score, the player will win
    gameState = 8;
    tm.stop();
  }
  if (playerScore >= nWinMediumScore && bEasy == false && bMedium == true && bHard == false) { // when the player reaches to the medium winning score, the player will win
    gameState = 10;
    tm.stop();
  }
  if (playerScore >= nWinHardScore && bEasy == false && bMedium == false && bHard == true) { // when the player reaches to the hard winning score, the player will win
    gameState = 11;
    tm.stop();
  }
  if (playerScore <= 29 && bEasy == true && bMedium == false && bHard == false) { // when score reaches below 30, the plyaer will loose
    gameState = 6;
  }
  if (playerScore <= 29 && bEasy == false && bMedium == true && bHard == false) { // when the scroe reaches below 30, the player will loose
    gameState = 6;
  }
  if (playerScore <= 29 && bEasy == false && bMedium == false && bHard == true) { // when the score reaches below 30, the player will loose
    gameState = 6;
  }
}
//void leaderboard() {
//  float Sortting;
//  if (gameState == 2) {
//    fill(150, 100);
//    rect(width/2 + (width/3), height/2 + (height/3.5), 200, 200);
//    Sortting= max(MovingB.fDiameter, StaticB.nDiameter);
//      text(Sortting, width/2 + (width/3), height/2 + (height/4));
//    }
//  }

void time() {
  textAlign(CENTER);
  fill(255);
  rect(width/2 + (width/3) + (width/10), height/30, 80, 35);
  fill(0);
  text(nf(tm.minute(), 2)+":"+nf(tm.second(), 2), width - 55, height/16);
  tm.stop();
}
void displayLevel() {
  if (bEasy == true && bMedium ==false && bHard == false) {
    fill(255);
    rect(width/2 - (width/11), height/45, 255, 40);
    textSize(40);
    fill(0, 0, 255);
    text("Level : Easy", width/2, height/16 - 10);
    textSize(30);
  } else if (bEasy == false && bMedium == true && bHard == false) {
    fill(255);
    rect(width/2 - (width/10), height/45, 270, 42);
    textSize(40);
    fill(0, 0, 255);
    text("Level : Medium", width/2, height/16);
    textSize(30);
  } else if (bEasy == false && bMedium == false && bHard == true) {
    fill(255);
    rect(width/2 - (width/10), height/45, 260, 40);
    textSize(40);
    fill(0, 0, 255);
    text("Level : Hard", width/2, height/16);
    textSize(30);
  }
}

//follows the keyboard function, works with the keyboard in the menu_buttons tab function
void keyPressed() {
  if (gameState == 7) {
    if (keyCode == BACKSPACE) {
      if (myText.length() > 0) {
        myText = myText.substring(0, myText.length()-1);
      }
    } else if (keyCode == DELETE) {
      myText = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != ENTER) {
      myText = myText + key;
    } else if (keyCode == ENTER) {
      gameState = 9;
    }
  }
}
//resets the game from the very beganning
void reset() {
  tm.stop();
  tm.start();
  alStaticCells.clear();
  alMovingCells.clear();
  alVirusCells.clear();
  gameState = 1;
  CameraZoom = 10;
  gridSize = 400;
  fNumStaticBalls = 700;
  fNumMovingBalls = 100;
  fNumVirusBalls = 50;
  PlayerCell = new PlayerB (50);
  for (int i= 0; i < fNumStaticBalls; i++) {
    alStaticCells.add(new StaticB());
  }
  for (int i=0; i < fNumMovingBalls; i++) {
    alMovingCells.add(new MovingB());
  }
  for (int i=0; i < fNumVirusBalls; i++) {
    alVirusCells.add(new VirusB());
  }
  PlayerCell.fDiameter = 50;
}

//date regarding the displaying of the game screen balls.
void backgroundData() {
  back1.backGround();
  back1.display();
  back2.display();
  back3.display();
  back4.display();
  back5.display();
  back7.display();
  back8.display();
  back9.display();
  back10.display();
}