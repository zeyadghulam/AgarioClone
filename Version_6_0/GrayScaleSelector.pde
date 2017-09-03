//GrayScale selector (in the options menu)
public class GrayScaleSelector {
  public int x, y, w, h, c;
  PImage CSSImage;

  //GrayScale Selector constructor
  public GrayScaleSelector ( int x, int y, int w, int h, int c ) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    CSSImage = new PImage( w, h );
    drawScale();
  }
  //scale is drawn only with gray color, no other colors.
  private void drawScale () {
    // draw grey scale.
    for ( int j=0; j<h; j++ ) {
      int g = 255 - (int)(j/(float)(h-1) * 255 );
      drawRect(55, j, 100, 1, color( g, g, g ) );
    }
  }
  //draws the frame only which contains the color inside.
  private void drawRect( int rx, int ry, int rw, int rh, int rc ) {
    for (int i=rx; i<rx+rw; i++) {
      for (int j=ry; j<ry+rh; j++) {
        CSSImage.set( i, j, rc );
      }
    }
  }
  //drawGradient is used to draw the CSS image, the whole gradient.
  public void drawGradient() {
    image( CSSImage, x, y );
  }
  //Paints background based on the position of mouseX, and mouseY
  public void grayPaint () {
    if (gameState == 4) {
      if ( mousePressed && mouseX >= x && mouseX < x + w && mouseY >= y && mouseY < y + h ) {
        c = get( mouseX, mouseY );
      }
      fill( c );
      rect( x + 70, y+h+110, 50, 50);
    } else {
      fill(c);
    }
  }
}