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
PlayerB PlayerCell;
float fNumBalls;
float CameraZoom = 10, gridSize = 400;
boolean bPause = false;
int gameState = 0;
void setup() {
  fullScreen();
  fNumBalls = 700;
  PlayerCell = new PlayerB (50);  // 50 is the player's diameter.

  //Static Cells are implemeneted
  for (int i = 0; i < fNumBalls; i++) {
    StaticCells.add(new StaticB());
  }
  fill(10, 73, 255);
  smooth();
}
void draw() {
  if (gameState ==2) {//Play Screen
    background(255);
    drawGrid();

    //static balls are displayed.
    for (int i=0; i < StaticCells.size(); i++) {
      StaticCells.get(i).display();
    }
    //pause screen
    if (keyPressed && (key == 'p' || key == 'P')) { 
      PlayerCell.Pause(); // calls it from the PlayerB tab
    }
    PlayerCell.runPlayerCell(); // display's and moves the player's ball.
    //game screen
  } else if (gameState == 0) {//press any key Screen
    backgroundData();
    //Main menu
  } else if (gameState == 1) {
    MenuScreen();
    Instructions();
    Options();
    Credits();
  } else if (gameState == 3) {//instructions
    background(255);
    Instructions();
  } else if (gameState == 4) {//options
    background(255);
    Options();
  } else if (gameState == 5) {//credits
    background(255);
    Credits();
  }
  //GameScreen
  if (keyPressed && gameState == 0) {
    gameState = 1;//Main Menu
  }
}
//Draws the grid
void drawGrid() {
  fill(255, 255, 255);
  rect(1*CameraZoom, 1*CameraZoom, width, height); // make rectangle
  strokeWeight(2);
  stroke(200, 200, 200); //stroke
  for (float i = 0 - PlayerCell.fX; i < gridSize - PlayerCell.fX; i = i + 10) {     // dublicate rectangles across the x-axies 
    line(i*CameraZoom, 1-PlayerCell.fY*CameraZoom, i*CameraZoom, height);
  }
  for (float i = 0 - PlayerCell.fY; i < gridSize - PlayerCell.fY; i = i + 10) {    // dublicate rectangles across the y-axies
    line(1-PlayerCell.fX*CameraZoom, i*CameraZoom, width, i*CameraZoom);
  }
}
//Checks if the grid's X is hit
int isHitGridX() { 
  if (CameraZoom*(0-PlayerCell.fX) > (width/2-PlayerCell.fDiameter/2)) { //Checks left
    return 1;
  } else if (CameraZoom*(gridSize-PlayerCell.fX) < (width/2+PlayerCell.fDiameter/1.5)) { //Checks right
    return 2;
  }
  return 0;
}
//Checks if the grid's Y is hit
int isHitGridY() {
  if (CameraZoom*(0-PlayerCell.fY) > (height/2-PlayerCell.fDiameter/2)) { // Checks top
    return 1;
  } else if (CameraZoom*(gridSize-PlayerCell.fY) < (height/2+PlayerCell.fDiameter/1.5)) { // checks bottom
    return 2;
  } 
  return 0;
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