class MovingB {
  float fX ;
  float fY ;
  float fRad = 0;
  float fDiameter;
  float fDx, fDy;
  float c1, c2, c3;

  MovingB () {
    fX = random(gridSize/1.001); 
    fY = random(gridSize/1.001); 

    if (bEasy == true && bMedium == false && bHard == false) {
      fDiameter = random(50, 80);
    } else if (bEasy == false && bMedium == true && bHard == false) {
      fDiameter = random(60, 100);
    } else if (bEasy == false && bMedium == false && bHard == true) {
      fDiameter = random(120, 200);
    }
    fDx= random(-0.3, 0.3);
    fDy= random(-0.3, 0.3);


    c1 = random(255);
    c2 = random(255);
    c3 = random(255);
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
    //left side only
    if (CameraZoom*(5-fX) > (fDiameter/10)) {
      fDx = fDx * -1;
      //right side only
    } else if (CameraZoom*(gridSize-fX) < (fDiameter/.5)) {
      fDx = fDx *-1;
      //Top side only
    } else if (CameraZoom*(5-fY) > (fDiameter/10)) {
      fDy = fDy *-1;
      //bottom side only
    } else if (CameraZoom*(gridSize-fY) < (fDiameter/.5)) {
      fDy = fDy *-1;
    }
  }

  void run() {
    display();
    move();
    isWindowHit();
  }
}