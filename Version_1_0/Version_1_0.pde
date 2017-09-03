int x;
int y;
int[] a;
int[] b;
int c;
int speed;
int w, h;
void setup() {
  size(800, 800);
  frameRate(30);
  x = width/2;
  y = height/2;
  a = new int[99];
  b = new int[99];
  c = 0;
  w=50;
  h=50;
  speed=5;
}
void draw() {
  background(255);
  if (mousePressed==true) {
    a[c] = x;
    b[c] = y;
    c=c+1;
  }  
  fill(100, 100, 255);
  if (mouseX > x) //right
    x+=speed;
  else if (mouseX < x) //left
    x-=speed;
  if (mouseY > y) //down
    y+=speed;
  else if (mouseY < y) //up
    y-=speed;
   ellipse(x, y, w, h);
}