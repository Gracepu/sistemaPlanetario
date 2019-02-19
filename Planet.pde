class Planet {
  private float angle;
  private float orbitDistance;
  private float velocity;
  private float radius;
  private PShape planet;
  private Planet moon;
  private String name;
  
  Planet(PImage img,float orbitDistance,float radius,float velocity,String name) {
    angle = 0;
    this.name = name;
    this.velocity = velocity;
    this.orbitDistance = orbitDistance;
    planet = createShape(SPHERE,radius);
    planet.setTexture(img);
  }
  
  // Method to spawn a moon
  public void createMoon(PImage imgMoon) {
    moon = new Planet(imgMoon,orbitDistance*0.15,10,velocity*2,null);
  }
  
  public void move() {
    pushMatrix();
    rotateY(radians(-angle));
    translate(-width*orbitDistance,0,0);
    shape(planet);
    if(name != null) {
      color c = color(226, 81, 39);
      fill(c);
      text(name,60,radius);
      noFill();
    }
    
    // Show moons if there are any
    if(moon != null) {
      moon.move();
    }
    popMatrix();
    
    // Control the rotation of the planet
    angle = angle + velocity;
    if(angle >= 360) {
      angle = 0;
    }
    
  }
}
