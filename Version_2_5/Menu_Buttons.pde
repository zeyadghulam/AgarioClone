void MenuScreen() {
  int nX;
  int nY;
  int nH = 100; 
  int nW = 50;
  nX = width/2 - 50;
  nY = height/2 - 25;
  if (gameState == 1) {
    background(255);
    textAlign(CENTER);
    textSize(76);
    text("AGAR.IO", width/2, 150);
    fill(255, 255, 255);
    rect(nX, nY, nH, nW);
    fill(0, 0, 0);
    textSize(30);
    text("Play", width/2, height/2 + 5);
    if (mousePressed) {
      if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
        gameState = 2;
      }
    }
  }
}