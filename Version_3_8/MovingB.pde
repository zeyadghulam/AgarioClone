class MovingB {
  float fX2 ;
  float fY2 ;
  float fRad = 0;
  float fDiameter;
  float fDx, fDy;
  float c1, c2, c3;
  float fGenerater;

  MovingB () {
    fX2 = random(gridSize/1.001);  // all balls are now inside boundries (X axies boundreis)
    fY2 = random(gridSize/1.001);   // all balls are now inside boundris  (Y axies boundirs)
    fDiameter = random(20, 40);

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
    ellipse(CameraZoom*(fX2 - PlayerCell.fX), CameraZoom*(fY2 - PlayerCell.fY), fDiameter, fDiameter);
  }

  void run() {
    display();
    move();
    isWindowHit();
    isPlayerThere();
  }

  void move() {
    fX2 = fX2 + fDx;
    fY2 = fY2 + fDy;
  }

  void isWindowHit() {
    // X - axies
    if (CameraZoom*(0-fX2) > (fDiameter/2)) {
      fDx = fDx *-1;
    } else if (CameraZoom*(gridSize-fX2) < (fDiameter/1.5)) {
      fDx = fDx *-1;
    }
    // Y - axies
    if (CameraZoom*(0-fY2) > (fDiameter/2)) {
      fDy = fDy *-1;
    } else if (CameraZoom*(gridSize - fY2) < (fDiameter/1.5)) {
      fDy = fDy *-1;
    }
  }

  void isPlayerThere() {
    if (CameraZoom*(0-fX2) > (PlayerCell.fX + 10 )) {
      fDx = fDx *-1;
    } else if (CameraZoom*(gridSize-fX2) < (PlayerCell.fX + 10)) {
      fDx = fDx *-1;
    } else if (CameraZoom*(0-fY2) > (PlayerCell.fY + 10)) {
      fDy = fDy *-1;
    } else if (CameraZoom*(gridSize - fY2) < (PlayerCell.fY + 10)) {
      fDy = fDy *-1;
    }
  }
}