public void MenuScreen() {
  int nH = 120; 
  int nX;
  int nY;
  int nW = 120;
  String sStart;
  sStart = "Play";
  if (bPause == false) {
    sStart = "Play";
  } else if (bPause == true) {
    sStart = "Resume";
  }
  nX = 300;
  nY = height/2 - 200;
  if (gameState == 1) {
    background(255);
    textAlign(CENTER);
    textSize(76);
    fill(0, 0, 0);
    text("IMMORTAL CELLS", width/2, 150);
    fill(255, 255, 255);
    rect(nX, nY, nH, nW);
    fill(0, 255, 255);
    ellipse(nX + 58, nY + nH/2, 120, 120);
    textSize(30);
    Options();
    Instructions();
    fill(0, 0, 0);
    text(sStart, 357, nY + 67);
    if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
      if (mousePressed) {
        gameState = 2;
      }
    }
  }
}
public void Instructions() {
  int nX, nXb;
  int nY, nYb;
  int nH = 180; 
  int nW = 180;
  int nHb = 100;
  int nWb = 50;
  nX = 650;
  nY = height/2 - 100;
  nXb = width/2 - 50;
  nYb = 900;
  if (gameState == 1) {
    textAlign(CENTER);
    textSize(30);
    fill(255, 255, 255);
    rect(nX, nY, nH, nW);
    fill(255, 255, 0);
    ellipse(nX + 90, nY + 90, 180, 180);
    fill(0, 0, 0);
    text("Instructions", nX + 90, nY + 97);
    if (mousePressed) {
      if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
        gameState = 3;
      }
    }
  } else if (gameState == 3) {
    textAlign(CENTER);
    textSize(76);
    text("Instructions", width/2, 150);
    textSize(25);
    text("The point of the game is to reach the top of the leaderboard", width/2, 300);
    text("Gain mass to advance up the ranks", width/2, 375);
    text("Do this by absorbing other circles", width/2, 450);
    text("Your circle will follow your mouse", width/2, 525);
    text("Customize your circle in the Options menu", width/2, 600);
    text("Press 'p' at any time to pause the game", width/2, 675);
    fill(255, 255, 255);
    rect(nXb, nYb, nHb, nWb);
    fill(0, 0, 0);
    textAlign(CORNER);
    text("Back", nXb + 20, nYb + 30);
    if (mousePressed) {
      if (mouseX > nXb && mouseX < nXb + nHb && mouseY > nYb && mouseY < nYb + nWb) {
        gameState = 1;
      }
    }
  }
}
public void Options() {
  PImage volbut;
  int nX, nXb;
  int nY, nYb;
  int nH = 130; 
  int nW = 130;
  int nHb = 100;
  int nWb = 50;
  nX = 400;
  nY = 700;
  nXb = width/2 - 50;
  nYb = 900;
  volbut = loadImage("volumebutton.png");
  volbut.resize(50, 50);
  if (gameState == 1) {
    textAlign(CENTER);
    textSize(30);
    fill(255, 255, 255);
    rect(nX, nY, nH, nW);
    fill(196, 131, 232);
    ellipse(nX + nH/2, nY + nW/2, 130, 130);
    fill(0, 0, 0);
    text("Options", nX + 64, nY + 75);
    if (mousePressed) {
      if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
        gameState = 4;
      }
    }
  } else if (gameState == 4) {
    textAlign(CENTER);
    textSize(76);
    text("Options", width/2, 150);
    textSize(12);
    text("Disclaimer:  The Options menu will be at full functionality by Version 5.5", width/2, height/2);
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
public void Credits() {
  int nX, nXb;
  int nY, nYb;
  int nH = 120; 
  int nW = 120;
  int nHb = 100;
  int nWb = 50;
  nX = 800;
  nY = 800;
  nXb = width/2 - 50;
  nYb = 900;
  if (gameState == 1) {
    textAlign(CENTER);
    textSize(30);
    fill(255, 255, 255);
    rect(nX, nY, nH, nW);
    fill(255, 95, 3);
    ellipse(nX + nH/2, nY + nW/2, 120, 120);
    fill(0, 0, 0);
    text("Credits", nX + 58, nY + 68);
    if (mousePressed) {
      if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
        gameState = 5;
      }
    }
  } else if (gameState == 5) {
    textAlign(CENTER);
    textSize(76);
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