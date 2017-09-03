//RBG colour Selector (In the options menu)
public class ColourSelector {
  public int x, y, w, h, c;
  PImage CSImage;

  //Colour Selector constructor
  public ColourSelector ( int x, int y, int w, int h, int c ) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    CSImage = new PImage( w, h );
    drawScale();
  }
  //color ratio, RGB colors are created.
  private void drawScale () {
    int cw, CreateRed, CreateGreen, CreateBlue, nColor;
    float fColorRatio, fRad;
    // draw color.
    cw = w - 60;
    for ( int i=0; i<cw; i++ ) {
      fColorRatio = i / (float)cw;
      fRad = (-360 * fColorRatio) * (PI / 180);
      CreateRed = (int)(cos(fRad) * 127 + 128) << 16;
      CreateGreen = (int)(cos(fRad + 2 * PI / 3) * 127 + 128) << 8;
      CreateBlue = (int)(Math.cos(fRad + 4 * PI / 3) * 127 + 128);
      nColor = CreateRed | CreateGreen | CreateBlue;
      setGradient( i, 0, 1, h/2, 0xFFFFFF, nColor );
      setGradient( i, (h/2), 1, h/2, nColor, 0x000000 );
    }
    // the black and white scale
    drawRect( cw, 0, 30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );
  }
  //The RGB is being changed whenever the mouse is pointed
  private void setGradient(int x, int y, float w, float h, int c1, int c2 ) {
    float ChangeRed, ChangeGreen, ChangeBlue;
    ChangeRed = red(c2) - red(c1);
    ChangeGreen = green(c2) - green(c1);
    ChangeBlue = blue(c2) - blue(c1);
    for (int j = y; j<(y+h); j++) {
      int c = color( red(c1)+(j-y)*(ChangeRed/h), green(c1)+(j-y)*(ChangeGreen/h), blue(c1)+(j-y)*(ChangeBlue/h) );
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
  //the mouse selects the colour. mouseX, mouseY are used to get the colour
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