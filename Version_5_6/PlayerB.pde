class PlayerB {
  float fDiameter = 20;
  float fX = 0;
  float fY = 0;
  float friction = 35;
  float Speed = 0.5;
  float horizontalSpeed = 100;
  PlayerB (int _nDiameter) {
    fDiameter = _nDiameter;
  }
  public void display() {
    CS.paint();
    ellipse(width/2, height/2, fDiameter, fDiameter);
  }
  public void display2() {
    CS.paint(); 
    stroke(0);
    strokeWeight(2);
    ellipse(width/2 - (width/6), height/2 + (height/6), 50, 50);
  }
  // down below are the if statments that controls the mouse direction, velocity, speed and collison.
  // Checks the X axies of the grid
  public void movePlayerCell() {
    if (gameState == 2) {
      if (isHitGridX() == 0) {
        fX = fX + (Speed*(mouseX - width/2))/friction/CameraZoom/fDiameter*horizontalSpeed;   // changge the 100 to control vertical speed
      } else if (isHitGridX() == 1 && mouseX > width/2) {       // Checks left // will not go right
        fX = fX + (Speed*(mouseX - width/2))/friction/CameraZoom*Speed;  // friction is added to reduce, put more weight on the player's ball.
      } else if (isHitGridX() == 2 && mouseX < width/2) {     // checks right // will not go left
        fX = fX + (Speed*(mouseX - width/2))/friction/CameraZoom*Speed;
      }
      //Checks the Y axies of the grid
      if (isHitGridY() == 0) {     
        fY = fY + (Speed*(mouseY - height/2))/friction/CameraZoom/fDiameter * horizontalSpeed;   // change the 100 to control the vertical speed;
      } else if (isHitGridY() == 1 && mouseY > height/2) {     // checks top // will not go bottom
        fY = fY + (Speed*(mouseY - height/2))/friction/CameraZoom*Speed;
      } else if (isHitGridY() == 2 && mouseY < height/2) {     // checks bottom // will not go top         
        fY = fY + (Speed*(mouseY - height/2))/friction/CameraZoom*Speed;
      }
    }
  }
  public void runPlayerCell() {
    movePlayerCell();
    display();
  }

  public void Pause() {
    if (gameState == 2) {
      if (keyPressed) {
        if (key == 'P'||key == 'p') {
          background(255, 255, 255);
          noStroke();
          bPause = true;
          gameState = 1;
        } else {
          bPause = false;
        }
      }
    }
  }
}