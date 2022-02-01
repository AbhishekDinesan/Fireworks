class Release {
  ArrayList<Sparks> sparkList;
  float x, y, xa, ya, startDis, finishDis, velocity, acceleration;
  color col;

  Release(float x_, float y_, color c_) {// Constructor
    sparkList = new ArrayList<Sparks>();
    x = x_; // recieves values from constructors parameters
    y = y_;
    col = c_;
    finishDis = 100; // ending distance of particles
    acceleration = 0.000075; //force of gravity pulling down on the particles, this constant just seems to work
  }

  void draw() {
    for (int a = 0; a < 720; a += 12) { 
      xa = sin(radians(a))*startDis; //referenced from website, https://krazydad.com/tutorials/circles_js/
      xa = 2.5*xa; // really important to make the fireworks move outwords
      ya = cos(radians(a))*startDis;
      ya = 2*ya; // really important to make the fireworks move outwords
      sparkList.add(new Sparks(x+xa, y+ya, col));//add OG position and new Position to determine coordinates of newSpark
      y += velocity;
      velocity += acceleration; //physics
    }
    for (int p = 0; p < sparkList.size(); p ++) {
      Sparks part = sparkList.get(p);
      part.draw(); // references draw function in Sparks Class
      sparkList.remove(p);
    }
    startDis++;
  }

  boolean over() { 
    return startDis > finishDis; // evaluate condition, returns true/false
  }
}
