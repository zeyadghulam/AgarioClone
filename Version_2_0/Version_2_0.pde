Background back1 = new Background (50, 50, 50, 255, 0, 0); 
Background back2 = new Background (100, 100, 100, 255, 255, 0);
Background back3 = new Background (100, 500, 30, 0, 0, 255);
Background back4 = new Background (400, 200, 60, 255, 150, 255);
Background back5 = new Background (500, 600, 30, 100, 60, 255);
Background back6 = new Background (500, 100, 90, 255, 0, 255);
Background back7 = new Background (600, 700, 110, 20, 80, 255);
Background back8 = new Background (400, 600, 90, 255, 255, 0);
PlayerB PlayerBall;
int gameState = 1;    // change from start page to play page here
void setup() {
  size(800, 800);
  PlayerBall = new PlayerB (width/2, height/2, 50, 50, 2);
}
void draw() {
  if (gameState ==0) {
    background(255);
    layout();
    PlayerBall.display();
    PlayerBall.move();
  } else if (gameState == 1) {
    backgroundData();
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
}