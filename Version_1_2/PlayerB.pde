class PlayerB {
  int x;
  int y;
  int c;
  int speed;
  int w, h;
  PlayerB(int x, int y, int w, int h, int speed) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
  }
  public void display() {
    fill(100, 100, 255);
    ellipse(x, y, w, h);
  }
  public void move() {
    if (mouseX > x) //right
      x+=speed;
    else if (mouseX < x) //left
      x-=speed;
    if (mouseY > y) //down
      y+=speed;
    else if (mouseY < y) //up
      y-=speed;
  }
  public void isWallHit() {
    if (x+25 > width || x - 25 < 0) {
      x = x -1;
    } else if (y + 25 >width || y - 25 < 0) {
      x = x -1;
    }
  }
}