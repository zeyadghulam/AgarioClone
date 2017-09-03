import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioPlayer player;
Minim minim;

void setupSound() {
  minim = new Minim(this);
  player = minim.loadFile("menucut.mp3");
}

void runSound() {
  player.play();
  player.loop();
}

void stopSound() {
  player.pause();
}

void Volbut() {
  int nX = width/3 + 5;
  int nY =  height/2 + height/4 + 8;
  int nW = 75, nH = 75;
  if (gameState == 1) {
    ellipseMode(CORNER);
    if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
      fill(237, 84, 212, 100);
    } else {
      fill(237, 84, 212);
    }
    ellipse(width/3, height/2 + height/4, 90, 90);
  }
  if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
    if (mousePressed) {
      if (bVol == false) {
        stopSound();
      } else if (bVol == true)
        runSound();
    }
  }
  ellipseMode(CENTER);
  image(volbut, nX, nY);
}

void mousePressed() {
 int nX = width/3 + 5;
 int nY =  height/2 + height/4 + 8;
 int nW = 75, nH = 75;
 if (mouseX > nX && mouseX < nX + nH && mouseY > nY && mouseY < nY + nW) {
     bVol = !bVol;
   }
 }