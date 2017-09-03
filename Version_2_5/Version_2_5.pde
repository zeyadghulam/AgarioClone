Background back1 = new Background (50, 900, 50, 255, 0, 0); 
Background back2 = new Background (540, 100, 100, 255, 255, 0);
Background back3 = new Background (100, 500, 30, 0, 0, 255);
Background back4 = new Background (400, 200, 60, 255, 150, 255);
Background back5 = new Background (750, 600, 30, 100, 60, 255);
Background back6 = new Background (1000, 150, 90, 255, 0, 255);
Background back7 = new Background (600, 700, 110, 20, 80, 255);
Background back8 = new Background (900, 900, 90, 255, 255, 0);
Background back9 = new Background (100, 150, 100, 26, 237, 207);
Background back10 = new Background (1024, 789, 34, 53, 26, 237);
Background back11 = new Background (1111, 500, 150, 26, 237, 42);
PlayerB PlayerBall;
int gameState = 0;
void setup() {
  fullScreen();
  PlayerBall = new PlayerB (width/2, height/2, 50, 50, 2);
}
void draw() {
  if (gameState ==2) {//Play Screen
    background(255);
    layout();
    PlayerBall.display();
    PlayerBall.move();
  } else if (gameState == 0) {//press any key Screen
    backgroundData();
  } else if (gameState == 1) {
    MenuScreen();
    
  }
  if (keyPressed && gameState == 0) {
    gameState = 1;//Main Menu
  }
}
void layout() {
  stroke(150);
  int grid = 50;
  for (int i = 0; i < width; i+=grid) {
    line (i, 0, i, height);
  }
  for (int i = 0; i < height; i+=grid) {
    line (0, i, width, i);
  }
}
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
}