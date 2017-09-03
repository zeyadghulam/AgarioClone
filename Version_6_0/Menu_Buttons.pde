//Menu_Buttons contains all of the buttons for the main menu
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
//Instructions screen
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
    text("INSTRUCTIONS", width/2, height/7);
    textSize(25);
    text("The point of the game is to reach the top of the leaderboard", width/2, height/4);
    text("Gain mass to advance up the ranks", width/2, height/3);
    text("Do this by absorbing other circles", width/2, height/3 + (height/3)/4);
    text("Your circle will follow your mouse", width/2, height/2);
    text("Customize your circle in the Options menu", width/2, height/2 + (height/3)/4);
    text("Press 'p' at any time to pause the game", width/2, height/2 + (height/2)/3);
    noFill();
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
//Options screen
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
    text("CUSTOMIZATION", width/2, height/2.5 - (height/3.5));
    noFill();
    noStroke();
    rect(nXb, nYb, nHb, nWb);
    fill(0, 0, 0);
    textSize(25);
    fill(150, 0, 0);
    text("Pick the COLOUR", width/2 - width/6.2, height/2 - height/4);
    fill(150, 150, 0);
    text("that you WANT !", width/2 - width/6.2, height/2 - height/5);
    fill(200);
    text("YOUR CELL'S COLOUR", width/2 - (width/6), height/2 + (height/4));
    ////////////
    textSize(25);
    fill(150, 0, 0);
    text("Choose the background COLOUR", width/2 + width/6.2, height/2 - height/4);
    fill(150, 150, 0);
    text("that you WANT !", width/2 + width/6.2, height/2 - height/5);
    fill(200);
    text("YOUR GRID COLOUR", width/2 +(width/6), height/2 + (height/4));
    ////
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
//Credits Screen
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
    text("Music is from Battleblock Theater, The Behemoth 2013", width/2, 675);
    noFill();
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
//Gameover screen
public void GameOver() {
  int nX = width/2 - 90;
  int nY = height/2 + (height/4);
  int nH = 260; 
  int nW = 60;
  int nX2 = width/2 - 110;
  int nY2 = height/2 + (height/3);
  int nH2 = 300;
  int nW2 = 70;
  if (gameState == 6) {
    rectMode(CORNER);
    background(Gameover);
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(50);
    text("SCORE: " + playerScore, width/2, height/6);
    fill(0, 255, 0);
    textSize(40);
    text("Highest Score: " + highplayerScore, width/2, height/3.7);

    textSize(40);
    fill(255, 255, 0);

    if (playerScore >= 30 && bEasy == true) {
      fill(255, 255, 0);
      text("*YOU WERE EATEN BY ANOTHER CELL*", width/2, height/2 + (height/6));
    } else if (playerScore >= 30 && bMedium == true) {
      fill(255, 255, 0);
      text("*YOU WERE EATEN BY ANOTHER CELL*", width/2, height/2 + (height/6));
    } else if (playerScore >= 30 && bHard == true) {
      fill(255, 255, 0);
      text("*YOU WERE EATEN BY ANOTHER CELL*", width/2, height/2 + (height/6));
    }

    if (playerScore <= 29 && bEasy == true) {
      fill(255, 255, 0);
      text("*A VIRUS HAS ATTACKED YOU*", width/2, height/2 + (height/6));
    } else if (playerScore <= 29 && bMedium == true) {
      fill(255, 255, 0);
      text("*A VIRUS HAS ATTACKED YOU*", width/2, height/2 + (height/6));
    } else if (playerScore <= 29 && bHard == true) {
      fill(255, 255, 0);
      text("*A VIRUS HAS ATTACKED YOU*", width/2, height/2 + (height/6));
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
    image(exit, nX2, nY2, nH2, nW2);
    if (mouseX > nX2 && mouseX < nX2 + nH2 && mouseY > nY2 && mouseY < nY2 + nW2) {
      if (mousePressed) {
        exit();
      }
    }
  }
}
//Setup keyboard function
public void Keyboard() {
  float fX, fY, fW, fH;
  fX = width/2;
  fY = height/2 + (height/3) - 20;
  fW = 350;
  fH = 60;
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
    text("PRESS ENTER", width/2, height/2 + (height/3));
    stroke(255);    
    noFill();
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