class Player
{
  PVector position; // X Y
  PVector velocity;
  PVector acceleration;
  
  float topspeed;
  float size = 50;
  
  Player()
  {
    position = new PVector(width/2,height/2);
    size = 55;
    topspeed = 25;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void Render()
  {
    fill(#106A13);
    ellipse(position.x, position.y, size, size);
  }
  
  void Update()
  {
    PVector gravity = new PVector(0,0.3);
    
    acceleration.add(gravity);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
    
  }
  
  void SetAcceleration(PVector accel)
  {
    acceleration = accel.copy();
  }
  
  
}