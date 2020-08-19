
Player player;


PVector mousePosClicked = new PVector(0, 0);
PVector mousePosReleased = new PVector(0, 0);
boolean pressed = false;
PVector launchDirection = new PVector(0, 0);

float MAX_LAUNCH_SPEED = 15;
float MIN_LAUNCH_SPEED = 3;
float LAUNCH_SPEED = 5;


void setup()
{
  size(800, 920);
  launchDirection = new PVector(0, 0);
  player = new Player();
}


void draw()
{
  background(0);
  PVector mouse = new PVector(mouseX, mouseY);
  player.Render();
  player.Update();

  if (mousePressed)
  {
    if (pressed == false)
    {
      pressed = true;

      mousePosClicked = new PVector(mouseX, mouseY);
    }

    float currLineMag = dist( mousePosClicked.x, mousePosClicked.y, mouseX, mouseY);
    strokeWeight(3);
    stroke(0, 150, 0);
    text(currLineMag, mouseX-50, mouseY);
    line(mouseX, mouseY, mousePosClicked.x, mousePosClicked.y);

    if (currLineMag > 100)
    {

      PVector newLineDir = mouse.copy().sub(mousePosClicked);
      newLineDir.normalize();
      newLineDir.mult(100);

      PVector newStartPosition = mousePosClicked.copy().add(newLineDir);
      stroke(#FFFF00);
      line(newStartPosition.x, newStartPosition.y, mouseX, mouseY);

      if (currLineMag > 200)
      {



        PVector newStartPositionRed = newStartPosition.copy().add(newLineDir);
        stroke(#FF0000);
        line(newStartPositionRed.x, newStartPositionRed.y, mouseX, mouseY);

        if (currLineMag > 200)
        {



          PVector newStartPositionBlack = newStartPositionRed.copy().add(newLineDir);
          stroke(#000000);
          line(newStartPositionBlack.x, newStartPositionBlack.y, mouseX, mouseY);
        }
      }
    }





    strokeWeight(1);
    stroke(0, 0, 0);

    //0-100 green, 101-200, 201-300 red
  }
}

void mouseReleased()
{
  pressed = false;
  mousePosReleased = new PVector(mouseX, mouseY);

  launchDirection = mousePosClicked.copy().sub(mousePosReleased);

  /*  
   acceleration = dir;
   velocity.add(acceleration);
   velocity.limit(topspeed);
   
   position.add(velocity);
   */

  //line  maxSpedd green yellow red black line to indicate power

   float currLineMag = dist( mousePosClicked.x, mousePosClicked.y, mouseX, mouseY);
  launchDirection.normalize();
  
 
  
  float final_launch_speed = map(currLineMag, 0,300, MIN_LAUNCH_SPEED, MAX_LAUNCH_SPEED);
  

  launchDirection.mult(final_launch_speed);
  launchDirection.limit(MAX_LAUNCH_SPEED);
    println(launchDirection.mag());
  player.SetAcceleration(launchDirection);
}

void mouseDragged()
{
}