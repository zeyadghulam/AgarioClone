public void MenuScreen() {
  int nH = width/10; 
  int nX;
  int nY;
  int nW = width/10;
  String sStart;
  sStart = "Play";
  if (bPause == false) {
    sStart = "Play";
  } else if (bPause == true) {
    sStart = "Resume";
  }
  nX = width/7;
  nY = height/7;
  if (gameState == 1) {
    noStroke();
    background(menuscreen);
    Volbut();
    textAlign(CENTER);
    noFill();
    rect(nX, nY, nH, nW);
    if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
      fill(0, 255, 255, 100);
    } else {
      fill (0, 255, 255);
    }
    ellipse(nX + nW/2, nY + nH/2, nH, nW);
    textSize(76);
    fill(255);
    text("IMMORTAL CELLS", width/2, height/2);
    textSize(30);
    Options();
    Instructions();
    fill(0, 0, 0);
    text(sStart, nX + nW/2, nY + nH/2 + nH/9);

    if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
      if (mousePressed) {
        if (bPause == false) {
          gameState = 7;
        } else if (bPause == true) {
          gameState = 2;
        }
      }
    }
  }
}
public void Instructions() {
  noStroke();
  int nX, nXb;
  int nY, nYb;
  int nH = 180; 
  int nW = 180;
  int nHb = 100;
  int nWb = 50;
  nX = width - width/4;
  nY = height/4 - height/5;
  nXb = width/2 - nHb/2;
  nYb = height - height/9;
  if (gameState == 1) {
    textAlign(CENTER);
    textSize(30);
    noFill();
    rect(nX, nY, nH, nW);
    if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
      fill(255, 255, 0, 100);
    } else {
      fill (255, 255, 0);
    }
    ellipse(nX + 90, nY + 90, 180, 180);

    fill(0, 0, 0);
    text("Instructions", nX + 90, nY + 97);
    if (mousePressed) {
      if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
        gameState = 3;
      }
    }
  } else if (gameState == 3) {
    background(instructions);
    textAlign(CENTER);
    textSize(76);
    fill(0, 0, 0);
    text("Instructions", width/2, height/7);
    textSize(25);
    text("The point of the game is to reach the top of the leaderboard", width/2, height/4);
    text("Gain mass to advance up the ranks", width/2, height/3);
    text("Do this by absorbing other circles", width/2, height/3 + (height/3)/4);
    text("Your circle will follow your mouse", width/2, height/2);
    text("Customize your circle in the Options menu", width/2, height/2 + (height/3)/4);
    text("Press 'p' at any time to pause the game", width/2, height/2 + (height/2)/3);
    fill(255, 255, 255);
    rect(nXb, nYb, nHb, nWb);
    fill(0, 0, 0);
    textAlign(CORNER);
    text("Back", nXb + 20, nYb + 30);
    if (mousePressed) {
      if (mouseX > nXb && mouseX < nXb + nHb && mouseY > nYb && mouseY < nYb + nWb) {
        if (gameState == 3) {
          gameState = 1;
        }
      }
    }
  }
}
public void Options() {
  noStroke();
  int nX, nY, nW, nH;
  int nXb, nYb, nWb, nHb;
  nX = width/3 - width/5;
  nY = height - height/5;
  nH = 130; 
  nW = 130;
  nXb = width/2 - 50;
  nYb = height - height/9;
  nWb = 50;
  nHb = 100;
  if (gameState == 1) {
    textAlign(CENTER);
    textSize(30);
    noFill();
    rect(nX, nY, nH, nW);
    if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
      fill(196, 131, 232, 100);
    } else {
      fill(196, 131, 232);
    }
    ellipse(nX + nH/2, nY + nW/2, 130, 130);
    fill(0, 0, 0);
    text("Options", nX + 64, nY + 75);
    if (mousePressed) {
      if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
        gameState = 4;
      }
    }
  } else if (gameState == 4) {
    PlayerCell.display2();
    textSize(76);
    fill(0, 0, 0);
    text("CUSTOMIZATION", width/2, 150);
    fill(255, 255, 255);
    rect(nXb, nYb, nHb, nWb);
    fill(0, 0, 0);
    textSize(25);
    text("Choose your colour!", 221, 630);
    text("Choose the background colour!", 1000, 550);
    fill(0, 0, 0);
    textSize(25);
    text("Back", width/2, nYb + 30);
    if (mousePressed) {
      if (mouseX > nXb && mouseX < nXb + nHb && mouseY > nYb && mouseY < nYb + nWb) {
        if (gameState == 4) {
          gameState = 1;
        }
      }
    }
  }
}
public void Credits() {
  noStroke();
  int nX, nXb;
  int nY, nYb;
  int nH = 120; 
  int nW = 120;
  int nHb = 100;
  int nWb = 50;
  nX = width - width/3;
  nY = height - height/3;
  nXb = width/2 - 50;
  nYb = height - height/9;
  if (gameState == 1) {
    textAlign(CENTER);
    textSize(30);
    noFill();
    rect(nX, nY, nH, nW);
    if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
      fill(255, 95, 3, 100);
    } else {
      fill(255, 95, 3);
    }
    ellipse(nX + nH/2, nY + nW/2, 120, 120);
    fill(0, 0, 0);
    text("Credits", nX + 58, nY + 68);
    if (mousePressed) {
      if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
        gameState = 5;
      }
    }
  } else if (gameState == 5) {
    background(Credits);
    textAlign(CENTER);
    textSize(76);
    fill(0, 0, 0);
    text("Credits", width/2, 150);
    textSize(25);
    text("This game was created by Zeyad Ghulam and Kieran Halliday", width/2, 300);
    text("This game is an adaptation of the game Agar.io", width/2, 375);
    text("Thanks to Matheus Valadares for creating the original", width/2, 450);
    text("Thanks to our arms, for always being by our sides", width/2, 525);
    text("Thanks to our fingers, knowing we can always count on them", width/2, 600);
    fill(255, 255, 255);
    rect(nXb, nYb, nHb, nWb);
    fill(0, 0, 0);
    textSize(25);
    text("Back", width/2, nYb + 30);
    if (mousePressed) {
      if (mouseX > nXb && mouseX < nXb + nHb && mouseY > nYb && mouseY < nYb + nWb) {
        gameState = 1;
      }
    }
  }
}
void Volbut() {
  PImage volbut;
  int nX = width/2 + 5;
  int nY =  height/2 + height/4 + 8;
  int nW = 75, nH = 75;
  volbut = loadImage("volumebutton.png");
  volbut.resize(75, 75);
  if (gameState == 1) {
    ellipseMode(CORNER);
    if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
      fill(237, 84, 212, 100);
    } else {
      fill(237, 84, 212);
    }
    ellipse(width/2, height/2 + height/4, 90, 90);
  }
  if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
    if (mousePressed) {
      if (bVol == false) {
        player.pause();
      } else if (bVol == true)
        player.loop();
    } 
    if (bVol == true) {
      delay(100);
      bVol = false;
      delay(0);
    } else if (bVol == false) {
      delay(100);
      bVol = true;
      delay(0);
    }
  }
  ellipseMode(CENTER);
  image(volbut, nX, nY);
}

public void GameOver() {
  int nX = width/2 - 90;
  int nY = height/2 + (height/4);
  int nH = 260; 
  int nW = 60;
  if (gameState == 6) {
    rectMode(CORNER);
    background(Gameover);
    textAlign(CENTER);
    textSize(30);
    fill(255);
    text("Your Highest Score is ", width/2 - 380, height/4);
    text("Your Score is ", width/2 + 350, height/4);
    textSize(50);
    fill(255, 0, 0);
    text(highplayerScore, width/2 - 200, height/4);
    text(playerScore, width/2 + 480, height/4);
    textSize(40);
    fill(255, 255, 0);
    if (bEasy == true && bMedium == false && bHard == false) {
      text("YOU WERE EATEN BY ANOTHER CELL", width/2, height/2 + (height/6));
    } else if (bEasy == false && bMedium == true && bHard == false) {
      text("WATCH OUT FOR THE TINY CELLS", width/2, height/2 + (height/6));
    } else if (bEasy == false && bMedium == false && bHard == true) {
      text("WATCH OUT FOR EVERY SINGLE MOVE, DANGERZONE", width/2, height/2 + (height/6));
    }
    image(TryAgain, nX, nY, nH, nW);
    if (mousePressed && mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
      if (bEasy == true && bMedium == false && bHard == false) {
        EasyRestart();
      } else if (bMedium == true && bEasy == false && bHard == false) {
        Medium();
      } else if (bHard == true && bEasy == false && bMedium == false) {
        Hard();
      }
    }
  }
}

public void Keyboard() {
  float fSize = myText.length();
  if (fSize < PlayerCell.fDiameter) {
    fSize = PlayerCell.fDiameter/3;
  }
  if (gameState == 7) {
    background(EnterName);
    textAlign(CENTER);
    fill(255);
    textSize(50);
    text("TYPE YOUR NAME BELOW", width/2, height/4);
    textSize(30);
    text(myText, width/2, height/2 + 10);
    rectMode(CENTER);
    stroke(0);
    noFill();
    rect(width/2, height/2, 250, 30);
    textSize(50);
    text("PRESS ENTER", width/2, height - 100);
    textSize(30);
  } 
  if (gameState == 2) {
    textAlign(CENTER);
    textSize(fSize);
    fill(0);
    text(myText, width/2, height/2 + 3);
    textSize(30);
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////
void DifficultyEasy() {
  int nX, nY, nW, nH;
  nX = width/2 - 100;
  nY = height/2 - 100;
  nW = start.width;
  nH = start.height;
  background(DifficultyEasy);
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
  text("Easiest Level ever, just play and chill", width/2 - (width/4), height/2 - (height/4) + 35);
  //////
  textSize(50);
  fill(0, 0, 150);
  text("Cutomize your cell", width/2 - (width/4), height/2 + (height/4));
  textSize(25);
  fill(0, 0, 200);
  text("in options menu", width/2 - (width/4), height/2 + (height/4) + 30);
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
  nWinEasyScore = 200;
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

void Easy() {
  if (bEasy == true) {
    fNumStaticBalls = 700;
    fNumMovingBalls = 100;
    fNumVirusBalls = 50;
    nWinEasyScore = 250;
  }
  bMedium = false;
  bHard = false;
}

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
  text("You Have Won the easy LEVEL !!!", width/2, height/4);
  textSize(30);
  text(myText + " have reached " + playerScore + " mass " + " by this time !!!", width/2, height/2);
  pauseTime();
  if (playerScore <= 30) {
    gameState = 6;
  }
  fill(255, 0, 0);
  image(exit, nX, nY, nW, nH); 
  if (mouseX > nX && mouseX < nX + nW && mouseY > nY && mouseY < nY + nH) {
    if (mousePressed) {
      exit();
    }
  } 
  fill(0, 0, 255);
  image(Replay, nX2, nY2, nW2, nH2);
  if (mouseX > nX2 && mouseX < nX2 + nW2 && mouseY > nY2 && mouseY < nY2 + nH2) {
    if (mousePressed) {
      EasyRestart();
    }
  }
  image(NextLevel, nX3, nY3, nW3, nH3);
  if (mouseX > nX3 && mouseX < nX3 + nW3 && mouseY > nY3 && mouseY < nY3 + nH3) {
    if (mousePressed) {
      gameState = 12;
      //Medium();
      //bMedium = true;
    }
  }
}
////////////////////////////////////////////////////////////////////////

void DifficultyMedium() {
  int nX, nY, nW, nH;
  nX = width/2 - 100;
  nY = height/2 - 100;
  nW = start.width;
  nH = start.height;
  background(DifficultyMedium);
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
  text("It will get tricky beyond this point, be carefull", width/2 - (width/4), height/2 - (height/4) + 35);
  //////
  textSize(50);
  fill(0, 0, 150);
  text("Cutomize your cell", width/2 - (width/4), height/2 + (height/4));
  textSize(25);
  fill(0, 0, 200);
  text("in options menu", width/2 - (width/4), height/2 + (height/4) + 30);
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
    fNumVirusBalls = 150;
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
    nWinMediumScore = 300;
  }
  bEasy = false;
  bHard = false;
}

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
  text(myText + " have reached " + playerScore + " mass " + " by this time !!!", width/2, height/2);
  pauseTime();
  if (playerScore <= 30) {
    gameState = 6;
  }
  fill(255, 0, 0);
  image(exit, nX, nY, nW, nH); 
  if (mouseX > nX && mouseX < nX + nW && mouseY > nY && mouseY < nY + nH) {
    if (mousePressed) {
      exit();
    }
  } 
  fill(0, 0, 255);
  image(Replay, nX2, nY2, nW2, nH2);
  if (mouseX > nX2 && mouseX < nX2 + nW2 && mouseY > nY2 && mouseY < nY2 + nH2) {
    if (mousePressed) {
      Medium();
      bMedium = true;
    }
  }
  fill(255, 0, 255);
  image(NextLevel, nX3, nY3, nW3, nH3);
  if (mouseX > nX3 && mouseX < nX3 + nW3 && mouseY > nY3 && mouseY < nY3 + nH3) {
    if (mousePressed) {
      gameState = 13;
      //Hard();
      // bHard = true;
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////

void DifficultyHard() {
  int nX, nY, nW, nH;
  nX = width/2;
  nY = height/2;
  nW = start.width;
  nH = start.height;
  background(DifficultyHard);
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
  text("Try to survive in between the canver cells", width/2 - (width/4), height/2 - (height/4) + 35);
  //////
  textSize(50);
  fill(0, 0, 150);
  text("Cutomize your cell", width/2 - (width/4), height/2 + (height/4));
  textSize(25);
  fill(0, 0, 200);
  text("in options menu", width/2 - (width/4), height/2 + (height/4) + 30);
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
    fNumVirusBalls = 300;
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
    nWinHardScore = 400;
  }
  bEasy = false;
  bMedium = false;
}

void winHardScreen() {
  PImage Exit;
  Exit = loadImage("exit.png");
  float nX = width/4 - (width/8), nY = height/2 + (height/4), nW = 200, nH = 100;
  float nX2 = width/2 + (width/4), nY2 = height/2 + (height/4), nW2 = 100, nH2 = 100;
  float nX3 = width/2, nY3 = height/2 + (height/4), nW3 = 100, nH3 = 100;
  alStaticCells.clear();
  alMovingCells.clear();
  alVirusCells.clear();
  background(EasyWinScrn);
  textSize(75);
  fill(255);
  text("Hard Won", width/2, height/4);
  textSize(30);
  text(myText + " have reached " + playerScore + " mass " + " by this time !!!", width/2, height/2);
  pauseTime();
  if (playerScore <= 30) {
    gameState = 6;
  }
  fill(255, 0, 0);
  image(Exit, nX, nY, nW, nH); 
  if (mouseX > nX && mouseX < nX + nW && mouseY > nY && mouseY < nY + nH) {
    if (mousePressed) {
      exit();
    }
  } 
  fill(0, 0, 255);
  text("replay Hard", nX2, nY2, nW2, nH2);
  if (mouseX > nX2 && mouseX < nX2 + nW2 && mouseY > nY2 && mouseY < nY2 + nH2) {
    if (mousePressed) {
      Hard();
    }
  }
  fill(255, 0, 255);
  text("Replay from Easy", nX3, nY3, nW3, nH3);
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

//////////////////////////////////////////////////////////////////////////////

void pauseTime() {
  textAlign(CENTER);
  text(nf(tm.minute(), 2)+":"+nf(tm.second(), 2), width/2, height/2 + 30);
}