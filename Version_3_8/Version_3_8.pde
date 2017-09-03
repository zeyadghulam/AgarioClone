// The object of this version (Version 3.8) is to add SCORING
Background back1 = new Background (50, 900, 50, 255, 0, 0); //red, bottom left
Background back2 = new Background (540, 100, 100, 255, 255, 0);//yellow, middle-ish
Background back3 = new Background (100, 500, 30, 0, 0, 255);//small blue, bottom half
Background back4 = new Background (400, 200, 60, 255, 150, 255);//pink, top right
Background back5 = new Background (750, 500, 30, 100, 60, 255);//indigo,L 
Background back6 = new Background (1000, 150, 90, 255, 0, 255);//purple,right side
Background back7 = new Background (600, 700, 110, 20, 80, 255);//blue, bottom half
Background back8 = new Background (900, 900, 90, 255, 255, 0);//yellow,bottom
Background back9 = new Background (100, 150, 100, 26, 237, 207);//teal,left side
Background back10 = new Background (1024, 789, 34, 53, 26, 237);//dark blue,right side
Background back11 = new Background (1111, 500, 150, 26, 237, 42);//green,right side
Background back12 = new Background (230, 600, 99, 255, 104, 27);//orange,bottom left
ArrayList <StaticB> StaticCells = new ArrayList <StaticB> ();
ArrayList <MovingB> MovingCells = new ArrayList <MovingB> ();
PlayerB PlayerCell;
String sMsg, sMsg2;
float fNumStaticBalls, fNumMovingBalls;
float CameraZoom = 10, gridSize = 400;
int score, highScore;
int gameState = 0;
boolean bPause = false;
boolean bVol = true;
void setup() {
  //size(800, 400);
  fullScreen();
  fill(10, 73, 255);
  smooth();
  fNumStaticBalls = 700;
  fNumMovingBalls = 50;
  PlayerCell = new PlayerB (50);  // 50 is the player's diameter.

  //Static Cells are implemeneted
  for (int i = 0; i < fNumStaticBalls; i++) {
    StaticCells.add(new StaticB());
  }

  //MovingCells are implemnted
  for (int i=0; i < fNumMovingBalls; i++) {
    MovingCells.add(new MovingB());
  }
}

void draw() {
  if (gameState == 2) {
    background(255);
    drawGrid();
    score();

    //static balls are displayed.
    for (int i=0; i < StaticCells.size(); i++) {
      addBalls();
      StaticCells.get(i).display();
      isStaticHit(PlayerCell, StaticCells.get(i));
    }
    //Moving balls are displayed.
    for (int i = 0; i < MovingCells.size(); i++) {
      //addMovingBalls();
      MovingCells.get(i).run();
      isMovingHitPlayer(PlayerCell, MovingCells.get(i));
    }
  }

  //pause screen 
  if (keyPressed && (key == 'p' || key == 'P')) {     
    PlayerCell.Pause(); // calls it from the PlayerB tab
  }

  // display's and moves the player's ball.
  PlayerCell.runPlayerCell(); 

  //game screen
  if (gameState == 0) {//press any key Screen
    backgroundData();

    //Main menu
  } else if (gameState == 1) {
    MenuScreen();
    Instructions();
    Options();
    Credits();
    Volbut();
    //instructions
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
  }
  //GameScreen
  if (keyPressed && gameState == 0) {
    gameState = 1;//Main Menu
  }
}

//collision against player vs. static
void isStaticHit(PlayerB PlayerCell, StaticB Static) {
  noStroke();
  float collide;
  collide = dist(CameraZoom*(Static.fX - PlayerCell.fX), CameraZoom*(Static.fY - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
  if (collide < PlayerCell.fDiameter/2) {// the 2.5 controls the distance between the static ball and the player's ball, increase to attract slower, decrease to attract faster.
    PlayerCell.fDiameter = PlayerCell.fDiameter + Static.nDiameter/Static.nDiameter;  // Now the PlayerCell.fDiameter increases by ones. Mass increases by ones.
    println(PlayerCell.fDiameter);
    CameraZoom = CameraZoom - Static.nDiameter/500;  // the 500 controls the grid size, is playercell is bigger, the grid should shrinks
    StaticCells.remove(Static);
  }
}
//Collision with player vs. moving
void isMovingHitPlayer(PlayerB PlayerCell, MovingB moving) {
  noStroke();
  float collide;
  collide = dist(CameraZoom*(moving.fX2 - PlayerCell.fX), CameraZoom*(moving.fY2 - PlayerCell.fY), (0 - PlayerCell.fX)/CameraZoom + width/2, (0-PlayerCell.fY)/CameraZoom + height/2);
  if (collide < PlayerCell.fDiameter/2.5) {// the 2.5 controls the distance between the moving ball and the player's ball, increase to attract slower, decrease to attract faster.
    //println(collide);
    PlayerCell.fDiameter = PlayerCell.fDiameter + (moving.fDiameter/4);  
    CameraZoom = CameraZoom - moving.fDiameter/500;  // the 500 controls the grid size, is playercell is bigger, the grid should shrinks
    MovingCells.remove(moving);
  }
}

//Eaten Static balls are replaced with newer ones
void addBalls() {
  for (int i = 0; i < StaticCells.size(); i++) {
    while (fNumStaticBalls != StaticCells.size()) {
      StaticCells.add(new StaticB());   // the fX, and fY will be randomized;
      fNumStaticBalls = StaticCells.size();
      //println(balls.size() + " ball is added");
    }
  }
}

//Player score & high score
void score() {
  float fX = 10;
  float fY = 50;
  score = (int(PlayerCell.fDiameter));
  if (highScore <= score) {
    highScore = max(int(PlayerCell.fDiameter), int(PlayerCell.fDiameter));
  }
  rectMode(CORNER);
  rect(fX, fY-30, fY*6-20, 75);
  textSize(30);
  fill(0);
  text("Your Mass is " + score, fX+20, fY);
  text(" High Score is " + highScore, fX+15, fY+35);
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
  back11.display();
  back12.display();
}