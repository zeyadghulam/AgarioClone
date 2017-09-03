class StaticB {
  float fX ;
  float fY ;
  float fRad = 0;
  float fDiameter = 2;
  float C1, C2, C3; 

  StaticB () {
    fX = random(gridSize/1.001);  // all balls are now inside boundries (X axies boundreis)
    fY = random(gridSize/1.001);   // all balls are now inside boundris  (Y axies boundirs)
    C1 = random(255);
    C2 = random(255);
    C3 = random(255);
    //col = color(random(255),random(255),random(255);
  }

  public boolean display() {
   noStroke();
    fill(C1, C2, C3);
   ellipse(CameraZoom*(fX - PlayerCell.fX),CameraZoom*(fY - PlayerCell.fY),fDiameter*CameraZoom,fDiameter*CameraZoom);  // CameraZoom is added to balance them through the grid.
   return true;
  }
}