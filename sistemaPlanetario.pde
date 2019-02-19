PImage space;
PImage sun;
PImage mercury,venus,planet62c,earth,saturn;
PImage moon;
PImage spaceshipT;

Planet sunPlanet;
Planet mercuryPlanet;
Planet venusPlanet;
Planet somePlanet;
Planet earthPlanet;
Planet saturnPlanet;
Planet moonPlanet;

PShape spaceship;
float ang = HALF_PI;
float rotateVel = 0.05;
float x = 0,y=0;
int spaceShipSz = 20;
boolean sh_movingForward = false;
boolean sh_movingBackwards = false;
boolean sh_turningRight = false;
boolean sh_turningLeft = false;

String instructions = "Use the key arrows to move the spaceship around the scene";

void setup() {
  size(700,700,P3D);
  noStroke();
  noFill();
  
  // Load textures
  space = loadImage("espacio.png");
  sun = loadImage("sol.jpg");
  mercury = loadImage("mercury.jpg");
  venus = loadImage("venus.jpg");
  planet62c = loadImage("planet62c.jpg");
  earth = loadImage("earth.png");
  moon = loadImage("moon.jpg");
  saturn = loadImage("saturn.png");
  spaceshipT = loadImage("spaceshiptexture.jpg");
  
  // Create the planets
  sunPlanet = new Planet(sun,0,70,0.25,"Sun");
  mercuryPlanet = new Planet(mercury,0.15,20,0.8,"Mercury");
  venusPlanet = new Planet(venus,0.35,35,0.45,"Venus");
  somePlanet = new Planet(planet62c,-0.35,25,0.45,"62C");
  somePlanet.createMoon(moon);
  saturnPlanet = new Planet(saturn,0.8,50,0.1,"Saturn");
  earthPlanet = new Planet(earth,0.65,45,0.3,"Earth");
  earthPlanet.createMoon(moon);
  
  // Spaceship
  spaceship = createShape(RECT,0,80,70,70);
  spaceship.setTexture(spaceshipT);
}

void draw() {
  
  background(space);
  fill(255);
  text(instructions,0,20);
  noFill();
  // Change the center
  translate(width/2, height/2, 0);
  rotateX(radians(-45));
  
  // Move the planets
  sunPlanet.move();
  mercuryPlanet.move();
  venusPlanet.move();
  somePlanet.move();
  saturnPlanet.move();
  earthPlanet.move();
  
  // Spaceship
  pushMatrix();
  translate(width/2-5,height/2-5,-10);
  translate(x, y);
  rotate(ang);
  shape(spaceship);
  spaceshipMove();
  popMatrix();
}
  
void spaceshipMove() {
  //check movement of spaceShip
  float moveX = 2 * sin(ang); 
  float moveY = -2 * cos(ang);

  if (sh_movingForward) {
    x += moveX;
    y += moveY;
  }
  if (sh_movingBackwards) {
    x -= moveX;
    y -= moveY;
  }
  if (sh_turningRight) {
    ang += rotateVel;
  }
  if (sh_turningLeft) {
    ang -= rotateVel;
  }
}

// Check the keys
void keyPressed() {
  if (keyCode==RIGHT)sh_turningRight = true;
  if (keyCode==LEFT) sh_turningLeft = true;
  if (keyCode==UP) sh_movingForward = true;
  if (keyCode==DOWN) sh_movingBackwards = true;
}

void keyReleased() {
  if (keyCode==RIGHT)sh_turningRight = false;
  if (keyCode==LEFT) sh_turningLeft = false;
  if (keyCode==UP) sh_movingForward = false;
  if (keyCode==DOWN) sh_movingBackwards = false;
}
