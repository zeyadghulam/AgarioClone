import ddf.minim.*;
AudioPlayer player;
Minim minim;
Background back1 = new Background (50, 900, 50, 255, 0, 0); //red, bottom left
Background back2 = new Background (540, 100, 100, 255, 255, 0);//yellow, middle-ish
Background back3 = new Background (100, 500, 30, 0, 0, 255);//small blue, bottom half
Background back4 = new Background (1200, 350, 60, 255, 150, 255);//pink, top right
Background back5 = new Background (1100, 150, 90, 255, 0, 255);//purple,right side
Background back7 = new Background (100, 150, 100, 26, 237, 207);//teal,left side
Background back8 = new Background (1024, 789, 34, 53, 26, 237);//dark blue,right side
Background back9= new Background (1211, 600, 150, 26, 237, 42);//green,right side
Background back10 = new Background (230, 600, 99, 255, 104, 27);//orange,bottom left
PImage EnterName, menuscreen, instructions, Credits, EasyWinScrn, Gameover, DifficultyEasy, NextLevel;
PImage DifficultyMedium, DifficultyHard, virus, start, HomeScreen, exit, Options, Replay, TryAgain;
ArrayList <StaticB> alStaticCells = new ArrayList <StaticB> ();
ArrayList <MovingB> alMovingCells = new ArrayList <MovingB> ();
ArrayList <VirusB> alVirusCells = new ArrayList <VirusB> ();
String sMsg, sMsg2, myText = "";
float fNumStaticBalls, fNumMovingBalls, fNumVirusBalls, CameraZoom, gridSize;
int playerScore, highplayerScore, gameState = 0, nWinEasyScore, nWinMediumScore, nWinHardScore;
boolean bPause = false, bVol = false, bEasy = true, bMedium = false, bHard = false;
PFont font;
PlayerB PlayerCell;
Timer tm;
ColourSelector CS;
GrayScaleSelector GSS;
void setup() {
  fullScreen();
  //size(1366,768);
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
  DifficultyEasy = loadImage("DifficultyEasy.jpg");
  DifficultyEasy.resize(width, height);
  DifficultyMedium = loadImage("DifficultyMedium.jpg");
  DifficultyMedium.resize(width, height);
  DifficultyHard = loadImage("DifficultyHard.jpg");
  DifficultyHard.resize(width, height);
  virus = loadImage("virus.png");
  start = loadImage("start.png");
  HomeScreen = loadImage("gameScreen.jpg");
  HomeScreen.resize(width, height);
  Options = loadImage("skyblue.jpg");
  Options.resize(width, height);
  exit = loadImage("exit.png");
  NextLevel = loadImage("advance arrow.png");
  NextLevel.resize(600, 600);
  Replay = loadImage("replay.jpg");
  Replay.resize(100, 100);
  TryAgain = loadImage("tryagain.jpg");
  font = createFont("Arial", 56);
  textFont(font, 56);
  gridSize = 400;
  CameraZoom = 10;
  Easy();
  bEasy = true;
  tm = new Timer();
  tm.start();
  CS = new ColourSelector(100, 200, 300, 400, 150);
  GSS = new GrayScaleSelector(width/2 + (width/4), height/4, 50, 200, 255);
  smooth();
  PlayerCell = new PlayerB (50);  // 50 is the player's diameter.
  //Static Cells are implemeneted
  for (int i= 0; i < fNumStaticBalls; i++) {
    alStaticCells.add(new StaticB());
  }
  smooth();
  //alMovingCells are implemnted
  for (int i=0; i < fNumMovingBalls; i++) {
    alMovingCells.add(new MovingB());
  }
  smooth();
  //alVirusCells are implemnted
  for (int i=0; i < fNumVirusBalls; i++) {
    alVirusCells.add(new VirusB());
  }
  minim = new Minim(this);
  player = minim.loadFile("menucut.mp3", 2048);
  if (gameState == 1) {
    Volbut();
  }
  if (bVol == false) {
    player.loop();
  } else if (bVol == true) {
    player.close();
    player = minim.loadFile("menucut.mp3", 2048);
  }
}

void draw() {
  if (gameState == 2) {
    background(255, 150);
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
    //Player vs. Moving && Moving vs. Player
    for (int i = 0; i < alMovingCells.size(); i++) {
      isPlayerHitMoving(PlayerCell, alMovingCells.get(i));
      if (bMedium == true && bEasy == false && bHard == true) {
        isPlayerHitMoving2(PlayerCell, alMovingCells.get(i));
      }
    }
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
    time();
    displayLevel();
    PlayerCell.runPlayerCell();
    playerScore();
    Keyboard();
  }
  //pause screen 
  if (keyPressed && (key == 'p' || key == 'P')) {     
    PlayerCell.Pause();
  }
  //game screen
  if (gameState == 0) {//press any key Screen
    backgroundData();
  } else if (gameState == 1) {
    MenuScreen();
    Instructions();
    Options();
    Credits();
  } else if (gameState == 3) {
    background(255);
    Instructions();
  } else if (gameState == 4) {
    background(Options);
    Options();
    CS.drawGradient();
    CS.render();
    GSS.drawGradient();
    GSS.render();
  } else if (gameState == 5) {
    background(255);
    Credits();
  } else if (gameState == 6) {
    GameOver();
  } else if (gameState == 7) {
    Keyboard();
  } else if (gameState == 8) {
    winEasyScreen();
  } else if (gameState == 9) {
    DifficultyEasy();
  } else if (gameState == 10) {
    winMediumScreen();
  } else if (gameState == 11) {
    winHardScreen();
  } else if (gameState == 12) {
    DifficultyMedium();
  } else if (gameState == 13) {
    DifficultyHard();
  }
  //GameScreen
  if (keyPressed && gameState == 0) {
    gameState = 1;
  }
}
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
      //CameraZoom = CameraZoom - Moving.fDiameter/300;  // the 500 controls the grid size, is playercell is bigger, the grid should shrinks
      alMovingCells.remove(Moving);
    }
  }
}

void isPlayerHitMoving2(PlayerB PlayerCell, MovingB Moving) {
  if (PlayerCell.fDiameter > Moving.fDiameter) {
    float collide;
    collide = dist(CameraZoom*(Moving.fX - PlayerCell.fX), CameraZoom*(Moving.fY - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
    if (collide <= PlayerCell.fDiameter * 1.5 && collide >= PlayerCell.fDiameter * 1.4) {
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
  if (Moving1.fDiameter > Moving2.fDiameter || Moving2.fDiameter > Moving1.fDiameter) {
    float distance = dist(Moving1.fX, Moving1.fY, Moving2.fX, Moving2.fY);
    if (distance < 3) {
      Moving2.fDiameter = Moving2.fDiameter + (Moving1.fDiameter/2);
      alMovingCells.remove(Moving1);
    }
  } else if (Moving2.fDiameter > Moving1.fDiameter) {
    float distance = dist(Moving1.fX, Moving1.fY, Moving2.fX, Moving2.fY);
    if (distance < 3) {
      Moving1.fDiameter = Moving1.fDiameter + (Moving2.fDiameter/2);
      Moving2.fDiameter = Moving2.fDiameter + (Moving1.fDiameter/2);
      alMovingCells.remove(Moving2);
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
    if (distance < 2) {
      Moving.fDiameter = Moving.fDiameter - Moving.fDiameter/Virus.nDiameter;
      alVirusCells.remove(Virus);
    }
  } else if (Moving.fDiameter < Virus.nDiameter) {
    float distance = dist(Moving.fX, Moving.fY, Virus.fX, Virus.fY); 
    if (distance < 2) {
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
      println(alStaticCells.size() + " ball is added");
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
  rect(width/52, height/30, 240, 40);
  fill(0);
  text(" High Score : " + highplayerScore, width/10, height/16);
  fill(255);
  if (playerScore >= nWinEasyScore && bEasy == true && bMedium == false && bHard == false) {
    gameState = 8;
    tm.stop();
  }
  if (playerScore >= nWinMediumScore && bEasy == false && bMedium == true && bHard == false) {
    gameState = 10;
    tm.stop();
  }
  if (playerScore >= nWinHardScore && bEasy == false && bMedium == false && bHard == true) {
    gameState = 11;
    tm.stop();
  }
  if (playerScore <= 29 && bEasy == true && bMedium == false && bHard == false) {
    gameState = 8;
  }
  if (playerScore <= 29 && bEasy == false && bMedium == true && bHard == false) {
    gameState = 10;
  }
  if (playerScore <= 29 && bEasy == false && bMedium == false && bHard == true) {
    gameState = 11;
  }
}
void time() {
  textAlign(CENTER);
  fill(255);
  rect(width/2 + (width/3) + (width/10), height/30, 80, 33);
  fill(0);
  text(nf(tm.minute(), 2)+":"+nf(tm.second(), 2), width - 55, height/16);
}
void displayLevel() {
  if (bEasy == true && bMedium ==false && bHard == false) {
    fill(255);
    rect(width/2 - (width/10), height/30, 250, 40);
    textSize(40);
    fill(0, 0, 255);
    text("Level : Easy", width/2, height/16);
    textSize(30);
  } else if (bEasy == false && bMedium == true && bHard == false) {
    fill(255);
    rect(width/2 - (width/10), height/30, 250, 40);
    textSize(40);
    fill(0, 0, 255);
    text("Level : Medium", width/2, height/16);
    textSize(30);
  } else if (bEasy == false && bMedium == false && bHard == true) {
    fill(255);
    rect(width/2 - (width/10), height/30, 250, 40);
    textSize(40);
    fill(0, 0, 255);
    text("Level : Hard", width/2, height/16);
    textSize(30);
  }
}

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