class VirusB {
  float fX, fY;
  float fDx, fDy;
  float C1, C2, C3; 
  int nDiameter = 5;

  //Virus Constructor
  VirusB () {
    //Virus sizes are set for  each level
    C1 = random(255);
    C2 = random(255);
    C3 = random(255);
    if (bEasy == true && bMedium == false && bHard == false) {
      nDiameter = 5;
    } else if (bEasy == false && bMedium == true && bHard == false) {
      nDiameter = int(3);
    } else if (bEasy == false && bMedium == false && bHard == true) {
      nDiameter = 2;
    }
    fX = random(gridSize/1.001);  // all balls are now inside boundries (X axies boundreis)
    fY = random(gridSize/1.001);   // all balls are now inside boundris  (Y axies boundirs)
  }

  void display() {
    noStroke();
    if (bEasy == true && bMedium == false && bHard == false) {
      image(virus, CameraZoom*(fX - PlayerCell.fX), CameraZoom*(fY - PlayerCell.fY), nDiameter*CameraZoom, nDiameter*CameraZoom);
    } else if (bEasy == false && bMedium == true && bHard == false) {
      fill(C1, C2, C3);
      ellipse(CameraZoom*(fX - PlayerCell.fX), CameraZoom*(fY - PlayerCell.fY), nDiameter*CameraZoom, nDiameter*CameraZoom);
    } else if (bEasy == false && bMedium == false && bHard == true) {
      fill(C1, C2, C3);
      ellipse(CameraZoom*(fX - PlayerCell.fX), CameraZoom*(fY - PlayerCell.fY), nDiameter*CameraZoom, nDiameter*CameraZoom);
    }
  }
}