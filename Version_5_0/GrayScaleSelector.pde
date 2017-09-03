public class GrayScaleSelector {
  public int x, y, w, h, c;
  PImage cpImage;

  public GrayScaleSelector ( int x, int y, int w, int h, int c ) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    cpImage = new PImage( w, h );
    init();
  }

  private void init () {
    // draw grey scale.
    for ( int j=0; j<h; j++ ) {
      int g = 255 - (int)(j/(float)(h-1) * 255 );
      drawRect( w-30, j, 30, 1, color( g, g, g ) );
    }
  }

  private void drawRect( int rx, int ry, int rw, int rh, int rc ) {
    for (int i=rx; i<rx+rw; i++) {
      for (int j=ry; j<ry+rh; j++) {
        cpImage.set( i, j, rc );
      }
    }
  }
  public void drawGradient() {
    image( cpImage, x, y );
  }
  public void render () {
    if (gameState == 4) {
      if ( mousePressed && mouseX >= x && mouseX < x + w && mouseY >= y && mouseY < y + h ) {
        c = get( mouseX, mouseY );
      }
      fill( c );
      rect( x, y+h+10, 50, 50);
    } else {
      fill(c);
    }
  }
}