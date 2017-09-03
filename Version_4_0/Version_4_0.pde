// The object of this version (Version 4.0) is to add Collision detection
Background back1 = new Background (50, 900, 50, 255, 0, 0); //red, bottom left
Background back2 = new Background (540, 100, 100, 255, 255, 0);//yellow, middle-ish
Background back3 = new Background (100, 500, 30, 0, 0, 255);//small blue, bottom half
Background back4 = new Background (400, 200, 60, 255, 150, 255);//pink, top right
Background back5 = new Background (1000, 150, 90, 255, 0, 255);//purple,right side
Background back6 = new Background (600, 700, 110, 20, 80, 255);//blue, bottom half
Background back7 = new Background (100, 150, 100, 26, 237, 207);//teal,left side
Background back8 = new Background (1024, 789, 34, 53, 26, 237);//dark blue,right side
Background back9= new Background (1111, 500, 150, 26, 237, 42);//green,right side
Background back10 = new Background (230, 600, 99, 255, 104, 27);//orange,bottom left
ArrayList <StaticB> alStaticCells = new ArrayList <StaticB> ();
ArrayList <MovingB> alMovingCells = new ArrayList <MovingB> ();
PlayerB PlayerCell;
String sMsg, sMsg2;
float fNumStaticBalls, fNumMovingBalls;
float CameraZoom, gridSize;
int playerScore, highplayerScore;
int gameState = 0;
boolean bPause = false;

void setup() {
  fullScreen();
  CameraZoom = 10;
  gridSize = 400;
  fNumStaticBalls = 700;
  fNumMovingBalls = 100;
  PlayerCell = new PlayerB (50);  // 50 is the player's diameter.
  //Static Cells are implemeneted
  for (int i = 0; i < fNumStaticBalls; i++) {
    alStaticCells.add(new StaticB());
  }
  //alMovingCells are implemnted
  for (int i=0; i < fNumMovingBalls; i++) {
    alMovingCells.add(new MovingB());
  }
}

void draw() {
  if (gameState == 2) {
    background(255);
    drawGrid();
    //Static Balls (Control Center). Displaying and hit testing the static cell with the players cell
    for (StaticB staticB : alStaticCells) {
      staticB.display();
    }
    for (int i=0; i < alStaticCells.size(); i++) {
      addStaticBalls();                                            
      isPlayerHitStatic(PlayerCell, alStaticCells.get(i));
    }
    //Moving Balls. Displaying Moivng Cells & Moving vs. Moving collision.
    for (MovingB movingB : alMovingCells) {
      movingB.run();
    }
    for (int a = 0; a < alMovingCells.size(); a++) {
      for (int b = 0; b < alMovingCells.size(); b++) {
        isMovingHitMoving(alMovingCells.get(a), alMovingCells.get(b));
      }
    }
    //Moving Balls (Control Center). & Player vs. Moving & Moving vs. Static.
    for (int i = alMovingCells.size()-1; i >= 0; i--) {
      isPlayerHitMoving(PlayerCell, alMovingCells.get(i));
      for (int j = alStaticCells.size()-1; j >= 0; j--) {         
        isMovingHitStatic(alMovingCells.get(i), alStaticCells.get(j));
        isMovingHitPlayer(alMovingCells.get(i), PlayerCell);
      }
    }
  }
  //pause screen 
  if (keyPressed && (key == 'p' || key == 'P')) {     
    PlayerCell.Pause();
  }
  PlayerCell.runPlayerCell(); 
  playerScore();
  //game screen
  if (gameState == 0) {//press any key Screen
    backgroundData();
    //Main menu
  } else if (gameState == 1) {
    MenuScreen();
    Instructions();
    Options();
    Credits();
  } else if (gameState == 3) {
    background(255);
    Instructions();
    //options
  } else if (gameState == 4) {
    background(255);
    Options();
    //credits
  } else if (gameState == 5) {
    background(255);
    Credits();
  } else if (gameState == 6) {
    background(0);
    GameOver();
  }
  //GameScreen
  if (keyPressed && gameState == 0) {
    gameState = 1;//Main Menu
  }
}
//Collision with Player vs. Static
void isPlayerHitStatic(PlayerB PlayerCell, StaticB Static) {
  noStroke();
  float collide;
  collide = dist(CameraZoom*(Static.fX - PlayerCell.fX), CameraZoom*(Static.fY - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
  if (collide < PlayerCell.fDiameter/2) {// the 2.5 controls the distance between the static ball and the player's ball, increase to attract slower, decrease to attract faster.
    PlayerCell.fDiameter = PlayerCell.fDiameter + Static.nDiameter/Static.nDiameter;  // Now the PlayerCell.fDiameter increases by ones. Mass increases by ones.
    //println(PlayerCell.fDiameter);
    CameraZoom = CameraZoom - Static.nDiameter/500;  // the 500 controls the grid size, is playercell is bigger, the grid should shrinks
    alStaticCells.remove(Static);
  }
}
//Collision with Player vs. Moving
void isPlayerHitMoving(PlayerB PlayerCell, MovingB Moving) {
  if (PlayerCell.fDiameter > Moving.fDiameter) {
    noStroke();
    float collide;
    collide = dist(CameraZoom*(Moving.fX - PlayerCell.fX), CameraZoom*(Moving.fY - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
    if (collide < PlayerCell.fDiameter/2) {// the 2.5 controls the distance between the moving ball and the player's ball, increase to attract slower, decrease to attract faster.
      PlayerCell.fDiameter = PlayerCell.fDiameter + (Moving.fDiameter/5);  
      CameraZoom = CameraZoom - Moving.fDiameter/300;  // the 500 controls the grid size, is playercell is bigger, the grid should shrinks
      alMovingCells.remove(Moving);
    }
  }
}
//Collision with Moving vs. Static
void isMovingHitStatic(MovingB Moving, StaticB Static) {
  float distance = dist(Moving.fX, Moving.fY, Static.fX, Static.fY); 
  if (distance < 3) {
    Moving.fDiameter = Moving.fDiameter + Static.nDiameter;
    alStaticCells.remove(Static);
  }
}
//Collision with Moving vs. Moving
void isMovingHitMoving(MovingB Moving1, MovingB Moving2) {
  if (Moving1.fDiameter > Moving2.fDiameter || Moving2.fDiameter > Moving1.fDiameter) {
    float distance = dist(Moving1.fX, Moving1.fY, Moving2.fX, Moving2.fY);
    if (distance < 2) {
      Moving2.fDiameter = Moving2.fDiameter + (Moving1.fDiameter/2);
      alMovingCells.remove(Moving1);
    }
  } else if (Moving2.fDiameter > Moving1.fDiameter) {
    float distance = dist(Moving1.fX, Moving1.fY, Moving2.fX, Moving2.fY);
    if (distance < 2) {
      Moving1.fDiameter = Moving1.fDiameter + (Moving2.fDiameter/2);
      Moving2.fDiameter = Moving2.fDiameter + (Moving1.fDiameter/2);
      alMovingCells.remove(Moving2);
    }
  }
}
//Collision with Moving vs. Player
void isMovingHitPlayer(MovingB Moving, PlayerB Player) {
  if (Moving.fDiameter > Player.fDiameter) {
    noStroke();
    float collide;
    collide = dist(CameraZoom*(Moving.fX - PlayerCell.fX), CameraZoom*(Moving.fY - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
    if (collide < Moving.fDiameter/2) {// the 2.5 controls the distance between the moving ball and the player's ball, increase to attract slower, decrease to attract faster.
      Moving.fDiameter = Moving.fDiameter + Player.fDiameter/2;  
      gameState = 6;
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
//Player playerScore & high playerScore
void playerScore() {
  float fX = 10;
  float fY = 50;
  float fSize = 30;
  playerScore = (int(PlayerCell.fDiameter));
  if (highplayerScore <= playerScore) {
    highplayerScore = max(int(PlayerCell.fDiameter), int(PlayerCell.fDiameter));
  }
  rectMode(CORNER);
  fill(255);
  rect(fX, fY-30, fY*6-20, 75);
  textSize(fSize);
  if (PlayerCell.fDiameter != fSize) {
    fSize = PlayerCell.fDiameter;
  }
  fill(0);
  text("Your Mass is " + playerScore, fX+120, fY);
  text(" High Score is " + highplayerScore, fX+120, fY+35);
  text(playerScore, width/2, height/2+10);
}
// data regarding the displaying of the game screen balls.
void backgroundData() {
  back1.backGround();
  back1.display();
  back2.display();
  back3.display();
  back4.display();
  back5.display();
  back6.display();
  back7.display();
  back8.display();
  back9.display();
  back10.display();
}