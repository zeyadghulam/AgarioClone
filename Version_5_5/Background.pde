public class Background {
  float x = 100;
  float y = 100;
  float size = 50;
  float fill1 = 0;
  float fill2 = 0;
  float fill3 = 0;
  public Background(float x, float y, float size, float fill1, float fill2, float fill3) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.fill1 = fill1;
    this.fill2 = fill2;
    this.fill3 = fill3;
  }
  public void backGround() {
    background(HomeScreen);
    smooth();
    textAlign(CENTER);
    String sMsg;
    String sMsg2;
    sMsg = "IMMORTAL";
    sMsg2 = "CELLS" ;
    textSize(164);
    fill(0);
    text(sMsg, width/2, height/2 - 100);
    text(sMsg2, width/2, height/2 + 100);
  }
  public void display() {
    noStroke();
    smooth();
    ellipseMode(CENTER);
    fill(fill1, fill2, fill3);
    ellipse(x, y, size, size);
    fill(255);
    textSize(30);
    text("Click to START", width/2, height/2 + height/3);
  }
}