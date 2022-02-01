// Declerations and Initilizations


ArrayList<Release> explosionArray;
ArrayList<Launch> launchArray;
float previousMillis = millis();
float timer =1000;

void setup() {
  size(700, 700);
  explosionArray = new ArrayList<Release>();
  launchArray = new ArrayList<Launch>();
}

// main draw function

void draw() {
  background(0);
  // timer used to create and add objects to launchArray
  if (millis() > previousMillis) {
    launchArray.add(new Launch());
    previousMillis = millis() + timer;
  }
  if (millis() > previousMillis) {
    launchArray.add(new Launch());
    previousMillis = millis() +3*timer;// produces synchronized effect
  }
  for (int r = 0; r < launchArray.size(); r++) {
    Launch spark = launchArray.get(r);
    spark.draw();// references draw method in the Spark Class, not the main draw method
    if (spark.reachedPos()) {//boolean value (deafults to true), stasified if spark position reaches where random coordinate is selected
      explosionArray.add(new Release(spark.getX(), spark.getY(), spark.getColor()));// add new explosion
      launchArray.remove(r);// remove the object once its exploded
      background(255); // momentarily changes the background color to white
    }
  }

  for (int n = 0; n < explosionArray.size(); n++) {
    Release releasePoint = explosionArray.get(n);
    releasePoint.draw();
  }
}

class Sparks {
  float x, y, diameter, distance, a;
  color c;

  Sparks(float x_, float y_, color col_) {
    // fields in the constructor
    x = x_;
    y = y_;
    c = col_;
    diameter = random(0, 10); //randomize the size of sparks from release
  }

  void draw() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }
}
