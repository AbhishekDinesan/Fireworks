class Launch {
  color c;
  float xPos, yPos, diameter, yPos2;

  Launch() {
    // fields for the object within constructor
    diameter = random (10, 20) ;
    xPos = random(0, width);
    yPos = height;
    yPos2 = random(50, 500);//produces differeing elevations
    c = color(random(50, 255), random(50, 255), random(50, 255)); // randomizes colour of launch particle
  }

  void draw() {
    // this draw function belongs to the Launch class, not the main program
    noStroke();
    fill(c);
    ellipse(xPos, yPos, diameter, diameter);
    yPos -= 15;
  }

  /* the program references these variables in the main draw function( as it is needed to add release objects , therefore we need to make its own function
   so that these values can be retrieved
   
   This particular way of doing this was through StackOverflow
   */

  boolean reachedPos() {
    return yPos < yPos2;//returns the result of this evaluation
  }

  color getColor() {
    return c;
  }

  float getX() {
    return xPos;
  }
  float getY() {
    return yPos;
  }

}
