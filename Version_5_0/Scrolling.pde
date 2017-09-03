//Draws the grid
void drawGrid() {
  //fill(0);
  GSS.render();
  rect(1*1, 1*1, width, height); // make rectangle
  strokeWeight(2);
  stroke(200, 200, 200); //stroke
  for (float i = 0 - PlayerCell.fX; i < 1000 - PlayerCell.fX; i = i + 10) {     // dublicate rectangles across the x-axies 
    line(i*CameraZoom, 1-PlayerCell.fY*CameraZoom, i*CameraZoom, height);
  }
  for (float i = 0 - PlayerCell.fY; i < 1000 - PlayerCell.fY; i = i + 10) {    // dublicate rectangles across the y-axies
    line(1-PlayerCell.fX*CameraZoom, i*CameraZoom, width, i*CameraZoom);
  }
}
//Checks if the grid's X is hit
int isHitGridX() { 
  if (CameraZoom*(0-PlayerCell.fX) > (width/2-PlayerCell.fDiameter/2)) { //Checks left
    return 1;
  } else if (CameraZoom*(gridSize-PlayerCell.fX) < (width/2+PlayerCell.fDiameter/1.5)) { //Checks right
    return 2;
  }
  return 0;
}

//Checks if the grid's Y is hit
int isHitGridY() {
  if (CameraZoom*(0-PlayerCell.fY) > (height/2-PlayerCell.fDiameter/2)) { // Checks top
    return 1;
  } else if (CameraZoom*(gridSize-PlayerCell.fY) < (height/2+PlayerCell.fDiameter/1.5)) { // checks bottom
    return 2;
  } 
  return 0;
}