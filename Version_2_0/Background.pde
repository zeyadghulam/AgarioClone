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
    background(255);
    smooth();
    textAlign(CENTER);
    String sMsg;
    sMsg = "AGAR.IO";
    textSize(164);
    fill(0);
    text(sMsg, width/2, height/2);
  }

  public void display() {
    noStroke();
    smooth();
    ellipseMode(CENTER);
    fill(fill1, fill2, fill3);
    ellipse(x, y, size, size);
  }
}