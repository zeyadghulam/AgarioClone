public class ColourSelector {
  public int x, y, w, h, c;
  PImage CSImage;

  public ColourSelector ( int x, int y, int w, int h, int c ) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    CSImage = new PImage( w, h );
    drawScale();
  }
  //the scale is set by percentage, formula is scorced.
  private void drawScale () {
    // draw color.
    int cw = w - 60;
    for ( int i=0; i<cw; i++ ) {
      float nColorPercent = i / (float)cw;
      float rad = (-360 * nColorPercent) * (PI / 180);
      int nR = (int)(cos(rad) * 127 + 128) << 16;
      int nG = (int)(cos(rad + 2 * PI / 3) * 127 + 128) << 8;
      int nB = (int)(Math.cos(rad + 4 * PI / 3) * 127 + 128);
      int nColor = nR | nG | nB;
      setGradient( i, 0, 1, h/2, 0xFFFFFF, nColor );
      setGradient( i, (h/2), 1, h/2, nColor, 0x000000 );
    }
    // draw black/white.
    drawRect( cw, 0, 30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );
  }
  //the gradient is set that consists of three different colours.
  private void setGradient(int x, int y, float w, float h, int c1, int c2 ) {
    float deltaR = red(c2) - red(c1);
    float deltaG = green(c2) - green(c1);
    float deltaB = blue(c2) - blue(c1);
    for (int j = y; j<(y+h); j++) {
      int c = color( red(c1)+(j-y)*(deltaR/h), green(c1)+(j-y)*(deltaG/h), blue(c1)+(j-y)*(deltaB/h) );
      CSImage.set( x, j, c );
    }
  }
  //the outside frame is drawn which contrains the scale.
  private void drawRect( int rx, int ry, int rw, int rh, int rc ) {
    for (int i=rx; i<rx+rw; i++) {
      for (int j=ry; j<ry+rh; j++) {
        CSImage.set( i, j, rc );
      }
    }
  }
  //the gradient image is drawn which contain the CSImage that is build in the setGradient function.
  public void drawGradient() {
    image( CSImage, x, y );
  }
  //the paint function paints the cell that is showin in options menu and the real player's cell.
  public void paint () {
    if (gameState == 4) {
      if ( mousePressed && mouseX >= x && mouseX < x + w && mouseY >= y && mouseY < y + h ) {
        c = get( mouseX, mouseY );
      }
      fill( c );
    } else {
      fill(c);
    }
  }
}