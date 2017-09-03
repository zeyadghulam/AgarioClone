class VirusB {
  float fX, fY;
  float fDx, fDy;
  float C1, C2, C3; 
  int nDiameter = 5;

  VirusB () {
    C1 = random(255);
    C2 = random(255);
    C3 = random(255);
    if (bEasy == true) {
      nDiameter = 5;
    } else if (bMedium == true && bHard == true) {
      nDiameter = 2;
    } else if (bHard == true) {
      nDiameter = 2;
    }
    fX = random(gridSize/1.001);  // all balls are now inside boundries (X axies boundreis)
    fY = random(gridSize/1.001);   // all balls are now inside boundris  (Y axies boundirs)
    //col = color(random(255),random(255),random(255);
  }

  void display() {
    noStroke();
    if (bEasy == true && bMedium == false && bHard == false) {
      image(virus, CameraZoom*(fX - PlayerCell.fX), CameraZoom*(fY - PlayerCell.fY), nDiameter*CameraZoom, nDiameter*CameraZoom);
    } else if (bEasy == false && bMedium == true && bHard == false) {
      fill(C1, C2, C3);
      ellipse(CameraZoom*(fX - PlayerCell.fX), CameraZoom*(fY - PlayerCell.fY), nDiameter*CameraZoom, nDiameter*CameraZoom);
    }
  }
}