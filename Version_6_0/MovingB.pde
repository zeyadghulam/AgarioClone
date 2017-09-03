//The moving cells class
class MovingB {
  float fX ;
  float fY ;
  float fRad = 0;
  float fDiameter;
  float fDx, fDy;
  float c1, c2, c3;
  int randomName;

  //Moving Cells constructor
  MovingB () {
    fX = random(gridSize/1.001); 
    fY = random(gridSize/1.001); 
    if (bEasy == true && bMedium == false && bHard == false) {
      fDiameter = random(60, 80);
    } else if (bEasy == false && bMedium == true && bHard == false) {
      fDiameter = random(70, 110);
    } else if (bEasy == false && bMedium == false && bHard == true) {
      fDiameter = random(120, 200);
    }
    fDx= random(-0.3, 0.3);
    fDy= random(-0.3, 0.3);
    c1 = random(255);
    c2 = random(255);
    c3 = random(255);
    randomName = int(random(33));
    sName = names[randomName];
  }
  //Moving Cells are displayed
  void display() {
    noStroke();
    // CameraZoom is added to balance them through the grid.
    fill(c1, c2, c3);
    ellipse(CameraZoom*(fX - PlayerCell.fX), CameraZoom*(fY - PlayerCell.fY), fDiameter, fDiameter);

    fill(0);
    text(names[randomName], CameraZoom*(fX - PlayerCell.fX), CameraZoom*(fY - PlayerCell.fY));
  }
  //Moving Cells are moved
  void move() {
    fX = fX + fDx;
    fY = fY + fDy;
  }
  //Wall collision detection
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
//All of the stored names regarding the moving cells.
void NameStoring() {
  names[0] = "Farquaad";
  names[1] = "Kanye";
  names[2] = "Sharkeisha";
  names[3] = "Chad";
  names[4] = "Robin";
  names[5] = "Joey";
  names[6] = "Shrek";
  names[7] = "Oscar";
  names[8] = "#rekt";
  names[9] = "Chappie";
  names[10] = "Rico";
  names[11] = "Santiago";
  names[12] = "Bobby";
  names[13] = "Carl";
  names[14] = "Othello";
  names[15] = "Phil";
  names[16] = "Spoderman";
  names[17] = "Bruce";
  names[18] = "Wayne";
  names[19] = "Arnold";
  names[20] = "Doritos";
  names[21] = "Zangief";
  names[22] = "Dankey Kang";
  names[23] = "Ed";
  names[24] = "Caesar";
  names[25] = "Leslie";
  names[26] = "Dank Memes";
  names[27] = "Trump";
  names[28] = "Hank Hill";
  names[29] = "Dr. Pepper Cherry";
  names[30] = "Aang, the last Airbender";  
  names[31] = "The Fresh Prince";  
  names[32] = "Jazzy Jeff";
}