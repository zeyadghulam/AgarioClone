//Overview screen for the EASY level
void InstructionsEasy() {
  tm.stop();
  tm.start();
  int nX, nY, nW, nH;
  nX = width/2 - 100;
  nY = height/2 - 100;
  nW = start.width;
  nH = start.height;
  background(InstructionsEasy);
  //////
  textSize(70);
  fill(255, 450);
  text("First Level", width/2, height/10);
  //////
  textSize(40);
  fill(150, 0, 0);
  text("Difficulty Level: EASY", width/2 - (width/4), height/2 - (height/4));
  textSize(25);
  fill(200, 0, 0);
  text("Reach 250 mass to progress to Medium", width/2 - (width/4), height/2 - (height/4) + 35);
  //////
  textSize(50);
  fill(0, 0, 150);
  text("Customize your cell", width/2 - (width/4), height/2 + (height/4));
  textSize(25);
  fill(0, 0, 200);
  text("in the options menu", width/2 - (width/4), height/2 + (height/4) + 30);
  ///////
  textSize(40);
  fill(50, 50, 50);
  text("You can PAUSE the game", width/2 + (width/4), height/2 - (height/4));
  textSize(25);
  text("at any Time by pressing", width/2 + (width/4), height/2 - (height/4) + 40);
  textSize(35);
  text("the letter 'P'", width/2 + (width/4), height/2 - (height/4) + 85);
  ///////
  textSize(40);
  fill(255);
  text("Go to INSTRUCTIONS", width/2 + (width/4), height/2 + (height/4));
  textSize(30);
  text("when you are CONFUSED", width/2 + (width/4), height/2 + (height/4) + 30);
  /////
  textSize(20);
  fill(50);
  text("* Watch out for mysterious actions while you play, notice the change in your mass when you eat *", width/2, height/2 + (height/2.5));
  ////////
  textSize(30);
  //////////
  image(start, nX, nY, nW, nH);
  if (mouseX > nX && mouseX < nX + nW && mouseY > nY && mouseY < nY + nH) {
    if (mousePressed) {
      gameState = 2;
    } else {
      gameState = 9;
    }
  }
}
//Only restart EASY
void EasyRestart() {
  tm.stop();
  tm.start();
  alStaticCells.clear();
  alMovingCells.clear();
  alVirusCells.clear();
  gameState = 2;
  CameraZoom = 10;
  gridSize = 400;
  fNumStaticBalls = 700;
  fNumMovingBalls = 100;
  fNumVirusBalls = 50;
  nWinEasyScore = EASYSCORE;
  PlayerCell = new PlayerB (50);
  for (int i= 0; i < fNumStaticBalls; i++) {
    alStaticCells.add(new StaticB());
  }
  for (int i=0; i < fNumMovingBalls; i++) {
    alMovingCells.add(new MovingB());
  }
  for (int i=0; i < fNumVirusBalls; i++) {
    alVirusCells.add(new VirusB());
  }
  PlayerCell.fDiameter = 50;
}
//Level EASY setup
void Easy() {
  if (bEasy == true) {
    CameraZoom = 10;
    gridSize = 400;
    fNumStaticBalls = 700;
    fNumMovingBalls = 100;
    fNumVirusBalls = 75;
    nWinEasyScore = EASYSCORE;
  }
  bMedium = false;
  bHard = false;
}
//Only shown when level EASY is passed
void winEasyScreen() {
  float nX = width/4 - (width/8), nY = height/2 + (height/4), nW = 200, nH = 100;
  float nX2 = width/2 + (width/4), nY2 = height/2 + (height/4), nW2 = 100, nH2 = 100;
  float nX3 = width/2, nY3 = height/2 + (height/4), nW3 = 100, nH3 = 100;
  alStaticCells.clear();
  alMovingCells.clear();
  alVirusCells.clear();
  background(EasyWinScrn);
  textSize(75);
  fill(255);
  text("You Have Won the EASY level !!!", width/2, height/4);
  textSize(30);
  text(myText + " has reached " + playerScore + " mass " + " by this time !!!", width/2, height/2);
  pauseTime();
  if (playerScore <= 30) {
    gameState = 6;
  }
  fill(255, 0, 0);
  image(exit, nX, nY, nW, nH); 
  if (mouseX > nX && mouseX < nX + nW && mouseY > nY && mouseY < nY + nH) {
    fill(50);
    text("EXIT THE GAME", nX + 100, nY - 20);
    if (mousePressed) {
      exit();
    }
  } 
  fill(0, 0, 255);
  image(Replay, nX2, nY2, nW2, nH2);
  if (mouseX > nX2 && mouseX < nX2 + nW2 && mouseY > nY2 && mouseY < nY2 + nH2) {
    fill(50);
    text("Replay Easy", nX2 + 50, nY2 - 20);
    if (mousePressed) {
      EasyRestart();
    }
  }
  image(NextLevel, nX3, nY3, nW3, nH3);
  if (mouseX > nX3 && mouseX < nX3 + nW3 && mouseY > nY3 && mouseY < nY3 + nH3) {
    fill(50);
    text("Level: Medium", nX3 + 50, nY3 - 20);
    if (mousePressed) {
      gameState = 12;
      //Medium();
      //bMedium = true;
    }
  }
}

//Overview Screen for level MEDIUM
void InstructionsMedium() {
  int nX, nY, nW, nH;
  nX = width/2 - 100;
  nY = height/2 - 100;
  nW = start.width;
  nH = start.height;
  background(InstructionsMedium);
  //////
  textSize(70);
  fill(255, 450);
  text("Second Level", width/2, height/10);
  //////
  textSize(40);
  fill(150, 0, 0);
  text("Difficulty Level: Medium", width/2 - (width/4), height/2 - (height/4));
  textSize(25);
  fill(200, 0, 0);
  text("Reach 350 mass to progress to Hard", width/2 - (width/4), height/2 - (height/4) + 35);
  //////
  textSize(50);
  fill(0, 0, 150);
  text("Customize your cell", width/2 - (width/4), height/2 + (height/4));
  textSize(25);
  fill(0, 0, 200);
  text("in the options menu", width/2 - (width/4), height/2 + (height/4) + 30);
  ///////
  textSize(40);
  fill(50, 50, 50);
  text("You can PAUSE the game", width/2 + (width/4), height/2 - (height/4));
  textSize(25);
  text("at any Time by pressing", width/2 + (width/4), height/2 - (height/4) + 40);
  textSize(35);
  text("the letter 'P'", width/2 + (width/4), height/2 - (height/4) + 85);
  ///////
  textSize(40);
  fill(255);
  text("Go to INSTRUCTIONS", width/2 + (width/4), height/2 + (height/4));
  textSize(30);
  text("when you are CONFUSED", width/2 + (width/4), height/2 + (height/4) + 30);
  /////
  textSize(20);
  fill(50);
  text("* It is time to pay more attention, notice the changes that occur every move *", width/2, height/2 + (height/2.5));
  ////////
  textSize(30);
  //////////
  image(start, nX, nY, nW, nH);
  if (mouseX > nX && mouseX < nX + nW && mouseY > nY && mouseY < nY + nH) {
    if (mousePressed) {
      //gameState = 2;
      Medium();
      bMedium = true;
    } else {
      gameState = 12;
    }
  }
}
//Level MEDIUM setup function
void Medium() {
  if (bMedium == true) {
    tm.stop();
    tm.start();
    alStaticCells.clear();
    alMovingCells.clear();
    alVirusCells.clear();
    gameState = 2;
    CameraZoom = 10;
    gridSize = 400;
    fNumStaticBalls = 800;
    fNumMovingBalls = 60;
    fNumVirusBalls = 170;
    PlayerCell = new PlayerB (50);
    for (int i= 0; i < fNumStaticBalls; i++) {
      alStaticCells.add(new StaticB());
    }
    for (int i=0; i < fNumMovingBalls; i++) {
      alMovingCells.add(new MovingB());
    }
    for (int i=0; i < fNumVirusBalls; i++) {
      alVirusCells.add(new VirusB());
    }
    for (int i = 0; i < alMovingCells.size(); i++) {
      isPlayerHitMoving2(PlayerCell, alMovingCells.get(i));
    }

    PlayerCell.fDiameter = 50;
    highplayerScore = max(int(PlayerCell.fDiameter), int(PlayerCell.fDiameter));
    nWinMediumScore = MEDIUMSCORE;
  }
  bEasy = false;
  bHard = false;
}
//Only shown when level MEDIUM is passed
void winMediumScreen() {
  float nX = width/4 - (width/8), nY = height/2 + (height/4), nW = 200, nH = 100;
  float nX2 = width/2 + (width/4), nY2 = height/2 + (height/4), nW2 = 100, nH2 = 100;
  float nX3 = width/2, nY3 = height/2 + (height/4), nW3 = 100, nH3 = 100;
  alStaticCells.clear();
  alMovingCells.clear();
  alVirusCells.clear();
  background(EasyWinScrn);
  textSize(75);
  fill(255);
  text("Medium Won", width/2, height/4);
  textSize(30);
  text(myText + " has reached " + playerScore + " mass " + " by this time !!!", width/2, height/2);
  pauseTime();
  if (playerScore <= 30) {
    gameState = 6;
  }
  fill(255, 0, 0);
  image(exit, nX, nY, nW, nH); 
  if (mouseX > nX && mouseX < nX + nW && mouseY > nY && mouseY < nY + nH) {
    fill(50);
    text("EXIT THE GAME", nX + 100, nY - 20);
    if (mousePressed) {
      exit();
    }
  } 
  fill(0, 0, 255);
  image(Replay, nX2, nY2, nW2, nH2);
  if (mouseX > nX2 && mouseX < nX2 + nW2 && mouseY > nY2 && mouseY < nY2 + nH2) {
    fill(50);
    text("Replay Medium", nX2 + 50, nY2 - 20);
    if (mousePressed) {
      Medium();
      bMedium = true;
    }
  }
  fill(255, 0, 255);
  image(NextLevel, nX3, nY3, nW3, nH3);
  if (mouseX > nX3 && mouseX < nX3 + nW3 && mouseY > nY3 && mouseY < nY3 + nH3) {
    fill(50);
    text("Level: Hard", nX3 + 50, nY3 - 20);
    if (mousePressed) {
      gameState = 13;
    }
  }
}

//Level Hard Overview screen
void InstructionsHard() {
  int nX, nY, nW, nH;
  nX = width/2 - 100;
  nY = height/2 - 100;
  nW = start.width;
  nH = start.height;
  background(InstructionsHard);
  //////
  textSize(70);
  fill(255, 450);
  text("Third Level", width/2, height/10);
  //////
  textSize(40);
  fill(150, 0, 0);
  text("Difficulty Level: Hard", width/2 - (width/4), height/2 - (height/4));
  textSize(25);
  fill(200, 0, 0);
  text("Reach 500 mass to WIN!", width/2 - (width/4), height/2 - (height/4) + 35);
  //////
  textSize(50);
  fill(0, 0, 150);
  text("Customize your cell", width/2 - (width/4), height/2 + (height/4));
  textSize(25);
  fill(0, 0, 200);
  text("in the options menu", width/2 - (width/4), height/2 + (height/4) + 30);
  ///////
  textSize(40);
  fill(50, 50, 50);
  text("You can PAUSE the game", width/2 + (width/4), height/2 - (height/4));
  textSize(25);
  text("at any Time by pressing", width/2 + (width/4), height/2 - (height/4) + 40);
  textSize(35);
  text("the letter 'P'", width/2 + (width/4), height/2 - (height/4) + 85);
  ///////
  textSize(40);
  fill(255);
  text("Eat the Cancer Cells", width/2 + (width/4), height/2 + (height/4));
  textSize(30);
  text("they are attacking the universe !!!", width/2 + (width/4), height/2 + (height/4) + 30);
  /////
  textSize(20);
  fill(50);
  text("* Customize your cells to trick the other cells, avoid eating food but consume the moving cells to last longer *", width/2, height/2 + (height/2.5));
  ////////
  textSize(30);
  //////////
  image(start, nX, nY, nW, nH);
  if (mouseX > nX && mouseX < nX + nW && mouseY > nY && mouseY < nY + nH) {
    if (mousePressed) {
      Hard();
      bHard = true;
    } else {
      gameState = 13;
    }
  }
}

//Level HARD setup
void Hard() {
  if (bHard == true) {
    tm.stop();
    tm.start();
    alStaticCells.clear();
    alMovingCells.clear();
    alVirusCells.clear();
    gameState = 2;
    CameraZoom = 10;
    gridSize = 400;
    fNumStaticBalls = 1000;
    fNumMovingBalls = 100;
    fNumVirusBalls = 370;
    PlayerCell = new PlayerB (50);
    for (int i= 0; i < fNumStaticBalls; i++) {
      alStaticCells.add(new StaticB());
    }
    for (int i=0; i < fNumMovingBalls; i++) {
      alMovingCells.add(new MovingB());
    }
    for (int i=0; i < fNumVirusBalls; i++) {
      alVirusCells.add(new VirusB());
    }
    PlayerCell.fDiameter = 50;
    highplayerScore = max(int(PlayerCell.fDiameter), int(PlayerCell.fDiameter));
    nWinHardScore = HARDSCORE;
  }
  bEasy = false;
  bMedium = false;
}
//Only shown when level hard is passed
void winHardScreen() {
  PImage Exit;
  float nX = width/4 - (width/8), nY = height/2 + (height/4), nW = 200, nH = 100;
  float nX2 = width/2 + (width/4), nY2 = height/2 + (height/4), nW2 = 100, nH2 = 100;
  float nX3 = width/2, nY3 = height/2 + (height/4), nW3 = 100, nH3 = 100;
  Exit = loadImage("exit.png");
  alStaticCells.clear();
  alMovingCells.clear();
  alVirusCells.clear();
  background(EasyWinScrn);
  textSize(75);
  fill(255);
  text("Hard Won", width/2, height/4);
  textSize(30);
  text(myText + " has reached " + playerScore + " mass " + " by this time !!!", width/2, height/2);
  pauseTime();
  if (playerScore <= 30) {
    gameState = 6;
  }
  fill(255, 0, 0);
  image(Exit, nX, nY, nW, nH); 
  if (mouseX > nX && mouseX < nX + nW && mouseY > nY && mouseY < nY + nH) {
    fill(50);
    text("EXIT THE GAME", nX + 100, nY - 20);
    if (mousePressed) {
      exit();
    }
  } 
  image(Replay, nX2, nY2, nW2, nH2);
  if (mouseX > nX2 && mouseX < nX2 + nW2 && mouseY > nY2 && mouseY < nY2 + nH2) {
    fill(50);
    text("Replay Hard", nX2 + 50, nY2 - 20);
    if (mousePressed) {
      Hard();
    }
  }
  fill(255, 0, 255);
  text("Start Over", nX3, nY3, nW3, nH3);
  if (mouseX > nX3 && mouseX < nX3 + nW3 && mouseY > nY3 && mouseY < nY3 + nH3) {
    if (mousePressed) {
      reset();
      if (gameState == 2) {
        winEasyScreen();
      }
      bEasy = true;
      bMedium = false;
      bHard = false;
    }
  }
}

//Pauses the time and displays it on the winning screens, for all levels.
void pauseTime() {
  textAlign(CENTER);
  text(nf(tm.minute(), 2)+":"+nf(tm.second(), 2), width/2, height/2 + height/15);
}