class MovingB {
  float fX ;
  float fY ;
  float fRad = 0;
  float fDiameter;
  float fDx, fDy;
  float c1, c2, c3;
  float fGenerater;

  MovingB () {
    fX = random(gridSize/1.001);  // all balls are now inside boundries (X axies boundreis)
    fY = random(gridSize/1.001);   // all balls are now inside boundris  (Y axies boundirs)
    fDiameter = random(20, 60);

    fDx= random(-0.3, 0.3);
    fDy= random(-0.3, 0.3);

    c1 = random(255);
    c2 = random(255);
    c3 = random(255);
    fGenerater = random(0, 1);
  }

  void display() {
    noStroke();
    // CameraZoom is added to balance them through the grid.
    fill(c1, c2, c3);
    ellipse(CameraZoom*(fX - PlayerCell.fX), CameraZoom*(fY - PlayerCell.fY), fDiameter, fDiameter);
  }
  void move() {
    fX = fX + fDx;
    fY = fY + fDy;
  }
  void isWindowHit() {
    // X - axies
    if (CameraZoom*(0-fX) > (fDiameter/2)) {
      fDx = fDx *-1;
    } else if (CameraZoom*(gridSize-fX) < (fDiameter/1.5)) {
      fDx = fDx *-1;
    }
    // Y - axies
    if (CameraZoom*(0-fY) > (fDiameter/2)) {
      fDy = fDy *-1;
    } else if (CameraZoom*(gridSize - fY) < (fDiameter/1.5)) {
      fDy = fDy *-1;
    }
  }
  void isPlayerThere() {
    if (CameraZoom*(0-fX) > (PlayerCell.fX + 10 )) {
      fDx = fDx *-1;
    } else if (CameraZoom*(gridSize-fX) < (PlayerCell.fX + 10)) {
      fDx = fDx *-1;
    } else if (CameraZoom*(0-fY) > (PlayerCell.fY + 10)) {
      fDy = fDy *-1;
    } else if (CameraZoom*(gridSize - fY) < (PlayerCell.fY + 10)) {
      fDy = fDy *-1;
    }
  }

  void run() {
    display();
    move();
    isWindowHit();
    // isPlayerThere();
  }
}