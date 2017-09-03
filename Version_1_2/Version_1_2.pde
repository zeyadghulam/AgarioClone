PlayerB PlayerBall;
void setup() {
  size(800, 800);
  // frame rate bug is fixed
  PlayerBall = new PlayerB (width/2, height/2, 50, 50, 2);
}
void draw() {
  background(255);
  layout();
  PlayerBall.display();
  PlayerBall.move();
  PlayerBall.isWallHit();
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